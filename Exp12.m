msg = [1 0 1 1 0 1 0 0];
% Define constraint length and generator polynomial
constraint_length = 3;
generator_polynomials = [7 5];
% Create trellis structure for the convolutional encoder
trellis = poly2trellis(constraint_length, generator_polynomials);
% Encode the message using convolutional encoder
encoded_msg = convenc(msg, trellis);
% Simulate noise by flipping a bit in the encoded message
encoded_msg_noisy = encoded_msg;
encoded_msg_noisy(4) = ~encoded_msg_noisy(4); % Flip the 4th bit to simulate noise
% Perform Viterbi decoding on the noisy message
traceback_length = 5;
decoded_msg = vitdec(encoded_msg_noisy, trellis, traceback_length, 'trunc', 'hard');
% Display results
disp('Original Message:');
disp(msg);
disp('Encoded Message:');
disp(encoded_msg);
disp('Noisy Encoded Message (with bit flip):');
disp(encoded_msg_noisy);
disp('Decoded Message:');
disp(decoded_msg);
