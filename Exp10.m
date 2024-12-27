% Hamming Encoding
% Define the data to encode
data = [1 0 1 0];
% Calculate the parity bits
p1 = mod(data(1) + data(3) + data(4), 2);
p2 = mod(data(1) + data(2) + data(4), 2);
p3 = mod(data(1) + data(2) + data(3), 2);

% Create the encoded data
encoded_data = [p1 p2 data(1) p3 data(2) data(3) data(4)];

disp('Encoded Data:');
disp(encoded_data);

% Hamming Decoding
% Define the encoded data with error
encoded_data = [1 0 1 0 1 0 1];
% Calculate the syndrome
s1 = mod(encoded_data(1) + encoded_data(3) + encoded_data(5) + encoded_data(7), 2);
s2 = mod(encoded_data(2) + encoded_data(3) + encoded_data(6) + encoded_data(7), 2);
s3 = mod(encoded_data(4) + encoded_data(5) + encoded_data(6) + encoded_data(7), 2);

% Determine the error location
error_location = bin2dec([num2str(s1) num2str(s2) num2str(s3)]);
% Correct the error
if error_location ~= 0
    encoded_data(error_location) = mod(encoded_data(error_location) + 1, 2);
end

% Extract the decoded data
decoded_data = encoded_data([3 5 6 7]);

disp('Decoded Data:');
disp(decoded_data);
