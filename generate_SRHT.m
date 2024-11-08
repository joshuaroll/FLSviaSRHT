function R = generate_SRHT(k, d)
    % Ensure that d is a power of 2 for the Hadamard matrix
    if mod(log2(d), 1) ~= 0
        error('d must be a power of 2 for the Hadamard matrix.');
    end

    % Step 1: Generate the Hadamard matrix H
    H = hadamard(d);

    % Step 2: Create the random diagonal matrix D with entries ±1
    D = diag(2 * randi(2, d, 1) - 3); % Generates ±1 on the diagonal

    % Step 3: Create the random sampling matrix P
    % Randomly select k indices from 1 to d
    selected_rows = randperm(d, k);
    P = sparse(1:k, selected_rows, 1, k, d); % k x d sampling matrix

    % Step 4: Construct the SRHT matrix R = P * H * D
    R = sqrt(d / k) * P * H * D;
end
