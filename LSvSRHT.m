function re = LSvSRHT(m, n, c)
% Run Least Squares via SRHT and solve Least Square by deterministic means
% and return the relative error
    % Part 1: Construct matrix A = U_M * S * V_M'
    %   Step 1: Generate Gaussian random matrix M and perform SVD
    M = randn(m, n); % m x n matrix with entries N(0,1)
    [U_M, ~, V_MT] = svd(M, 'econ');
    
    %   Step 2: Generate diagonal matrix S with specified σ values
    sigma_min = 1;
    sigma_max = 1e6;
    S = diag([sigma_min, linspace(1, sigma_max, n-2), sigma_max]);
    
    %   Step 3: Construct input matrix A as A = U_M * S * V_M'
    A = U_M * S * V_MT;
    
    % Part 2: Create SRHT matrix and use it on A 
    %   Step 4: Draw an n-dimensional Gaussian random vector b
    b = randn(n, 1);
    
    %   Step 5: Construct SRHT matrix S
    S = generate_SRHT(c,n);
    
    % Step 6: Apply SRHT projection to A and b
    A_prime = A * S';
    b_prime = S * b;
    
    % Step 7: Solve the reduced least squares problem
    x_prime = A_prime' \ b_prime;
    
    % Step 8: Calculate original solution using deterministic least squares for comparison
    x_opt = A' \ b;
    
    % Step 9: Compute relative error
    re = norm(A_prime' * x_prime - b_prime) / norm(A' * x_opt - b);
end

