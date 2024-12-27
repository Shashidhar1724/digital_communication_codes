% Define the given set of vectors
A =  [1 0 0; 1 1 1; 0 0 1]';

% Initialize an empty matrix to store orthogonal vectors
E = zeros(size(A));

% Perform Gram-Schmidt Orthogonalization
for j = 1:size(A, 2)
    v = A(:, j);
    for i = 1:j-1
        q = E(:, i);
        v = v - (v' * q) * q;
    end
    E(:, j) = v / norm(v);
end
disp(E)

% Plot the orthonormal vectors
figure;
hold on;
quiver3(0, 0, 0, E(1,1), E(2,1), E(3,1), 'r--', 'LineWidth', 2);
quiver3(0, 0, 0, E(1,2), E(2,2), E(3,2), 'g--', 'LineWidth', 2);
quiver3(0, 0, 0, E(1,3), E(2,3), E(3,3), 'b--', 'LineWidth', 2);
xlabel('X-axis');
ylabel('Y-axis');
title('Orthonormal Vectors');
grid on;
