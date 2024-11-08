% MATLAB code for Fast Least Squares via SRHT Projection
% Author: Joshua Rollins

% Set parameters
m = 5000; % Number of rows of the original matrix A, requires m >> n
n = 512;  % Number of columns in A (must be a power of 2 for SRHT)
c_values = 10:50:n; % Values of c to loop through (adjust range as needed)

% Initialize an array to store relative errors for each value of c
relative_errors = zeros(size(c_values));

% Loop through values of c and calculate the relative error
for i = 1:length(c_values)
    c = c_values(i); % Current value of c
    relative_errors(i) = LSvSRHT(m, n, c); % Compute relative error for this c
end

% Plot relative error with respect to c
figure;
plot(c_values, relative_errors, '-o');
xlabel('c (Reduced Dimension)');
ylabel('Relative Error');
title(sprintf('Relative Error vs Reduced Dimension (c) using SRHT (m = %d, n = %d)', m, n));
grid on;