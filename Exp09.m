% Input probability distribution
e = [1,2,4,2,3];
p = [0.5 0.2 0.15 0.15];
n = length(p); 
% Generate Huffman dictionary 
symbols = 1:n;
[dict, avglen] = huffmandict(symbols, p);
% Display Huffman dictionary 
disp('The Huffman code dictionary:'); 
for i = 1:n 
fprintf('Symbol %d: %s\n', symbols(i), num2str(dict{i, 2})); 
end
% Encode symbols 
sym = e;%input(sprintf('Enter the symbols between 1 to %d in []: ', n));
encod = huffmanenco(sym, dict); 
disp('The encoded output:'); 
disp(encod);
% Decode bit stream 
bits = encod; 
decod = huffmandeco(bits, dict); 
disp('The decoded symbols are:');
disp(decod);
