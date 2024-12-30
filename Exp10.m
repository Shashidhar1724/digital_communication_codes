% Example 4-bit data 
data = [1 0 1 0]% Example data: 1010
% Encode data 
G = [1 0 0 0 1 1 1; 
     0 1 0 0 1 0 1; 
     0 0 1 0 0 1 1; 
     0 0 0 1 1 1 0]; 
encoded_data = mod(data * G, 2);
disp('Encoded Data:');
disp(encoded_data); 
%Simulate bit error (flip 5th bit) 
received_data = encoded_data; 
received_data(5) = ~received_data(5); 
disp('Received Data (with error):'); 
disp(received_data);
% Decode data 
H = [1 1 1 0 1 0 0; 
     1 1 0 1 0 1 0; 
     1 0 1 1 0 0 1]; 
syndrome = mod(received_data * H', 2);
error_position = bi2de(syndrome, 'left-msb') + 1;
if any(syndrome) 
   disp(['Error detected at position: ', num2str(error_position)]); 
   received_data(error_position) = ~received_data(error_position);
else 
    disp('No error detected'); 
end   
decoded_data = received_data(1:4);
disp('Decoded Data:');
disp(decoded_data);
