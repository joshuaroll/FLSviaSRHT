# Fast Least Squares via Subsampled Randomized Hadamard Transform (SRHT)

Fast least squares method via SRHT projection to solve a large-scale least square problem by projecting a data matrix sample to a smaller dimension.

## Goal
Solves a large-scale least square problem by projecting a sample to a smaller dimension.

1. Define the input parameters `m`, `n`, and `k`, where `m ≫ n` and `k` is typically chosen as `O(n log n)`.
2. Generate an input matrix `A`:
    a) Create a Gaussian random matrix `M`.
    
    b) Compute its SVD.
    
    c) Generate a diagonal matrix `S = diag(σ1, ..., σn)` where `σ1 = 1`, `σn = 10^6`, and other `σi`s are uniformly chosen in `(1, 10^6)`.
    
    d) Construct `A` using the components of `M`'s SVD and `S`.
    
3. Generate a random vector `b` for the least squares problem.
4. Construct the SRHT projection matrix `S`, which consists of:
    a) A random diagonal matrix `D` with ±1 entries.
    
    b) A Hadamard matrix `H`.
    
    c) A random sampling matrix `P` - Here, `randperm` and `sparse` are used to select indices with space efficiency.
    
    d) `R = sqrt(d / k) * P * H * D`.
    
5. Project `A` and `b` into a smaller dimension using the SRHT matrix.
6. Solve the reduced least squares problem using the projected matrices. For the efficient fast algorithm, stop here and take the result out.
7. (Optional) For comparison, also solve the original least squares problem using a deterministic algorithm.
8. (Optional) Compute the relative approximation error between the randomized and deterministic solutions.
