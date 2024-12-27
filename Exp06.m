% Parameters
N = 10000;  % Number of bits
Eb_N0_dB = 0:5:20;  % Eb/N0 range in dB
Tb = 1;  % Bit duration

% Generate random bits
bits = randi([0 1], 1, N);

% Generate rectangular pulse
t = 0:0.01:Tb;
pulse = ones(size(t));

% Modulate bits using rectangular pulse
signal = zeros(size(t, 2)*N, 1);
for i = 1:N
    if bits(i) == 1
        signal((i-1)*size(t, 2)+1:i*size(t, 2)) = pulse;
    end
end

% Add AWGN noise
BER = zeros(size(Eb_N0_dB));
for i = 1:length(Eb_N0_dB)
    Eb_N0 = 10^(Eb_N0_dB(i)/10);
    noise = sqrt(1/(2*Eb_N0))*randn(size(signal));
    received_signal = signal + noise;
    
    % Matched filter receiver
    matched_filter = pulse(end:-1:1);  % Time-reversed pulse
    filtered_signal = conv(received_signal, matched_filter, 'same');
    
    % Detect bits
    detected_bits = zeros(size(bits));
    for j = 1:N
        if filtered_signal(j*size(t, 2)) > 0.5
                       detected_bits(j) = 1;
        end
    end
    
    % Calculate BER
    errors = sum(bits ~= detected_bits);
    BER(i) = errors/N;
end

% Plot BER vs Eb/N0
figure;
semilogy(Eb_N0_dB, BER);
xlabel('Eb/N0 (dB)');
ylabel('BER');
title('BER Performance of Binary Baseband Signaling');
grid on;
