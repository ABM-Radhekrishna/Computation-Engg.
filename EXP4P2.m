% Define the coefficient matrix A
A = [2, -1, 0, 0;
     -1, 2, -1, 0;
     0, -1, 2, -1;
     0, 0, -1, 2];

% Compute the eigenvalues and eigenvectors of A
[V, D] = eig(A);

% Extract the diagonal matrix of eigenvalues
lambda = diag(D);

% Define the right-hand side vector b
b = [500; 0; 0; 100];

% Initialize the solution vector x
x = zeros(size(b));

% Solve for each component of x
for i = 1:length(lambda)
    x = x + (V(:,i)' * b / lambda(i)) * V(:,i);
end

% Display the solution
disp('Solution x:');
disp(x);
