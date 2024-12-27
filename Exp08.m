% Parameters
M = 16;  % Number of symbols
N = 1000;  % Number of bits

% Generate random bits
bits = randi([0 1], 1, N);

% Convert bits to symbols
symbols = zeros(1, N/4);
for i = 1:N/4
    temp = bits(4*i-3:4*i);
    symbols(i) = (2*temp(1)-1) + 1j*(2*temp(2)-1) + 2*(2*temp(3)-1) + 2j*(2*temp(4)-1);
end

% Plot 16-QAM constellation
figure;
scatter(real(symbols), imag(symbols),'bo');
xlabel('In-phase');
ylabel('Quadrature');
title('16-QAM Constellation');
grid on;
