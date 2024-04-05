% Defining the grid size and time step
Nx = 50; % number of spatial grid points in x direction
Ny = 50; % number of spatial grid points in y direction
Nt = 300000; % number of time steps

% Define the physical properties
alpha1 = 0.01; % thermal diffusivity of material 1
alpha2 = 0.02; % thermal diffusivity of material 2

% Initialize the temperature field
T = zeros(Nx, Ny);

% Set the initial condition (heated box inside another box)
T(20:30, 20:30) = 50;

% Time stepping loop
for t = 1:Nt
    % Compute the Laplacian of T
    laplacianT = del2(T);
    
    % Update the temperature field based on the material properties
    T(1:Nx/2, :) = T(1:Nx/2, :) + alpha1 * laplacianT(1:Nx/2, :); % material 1
    T(Nx/2+1:end, :) = T(Nx/2+1:end, :) + alpha2 * laplacianT(Nx/2+1:end, :); % material 2
    
    % Maintain the temperature of the internal box
    %T(20:30, 20:30) = 50;
    
    % Apply the boundary conditions (constant temperature)
    T(1, :) = 200; % top boundary
    T(end, :) = 200; % bottom boundary
    T(:, 1) = 200; % left boundary
    T(:, end) = 200; % right boundary
    
    % Plot the temperature field
    if mod(t, 100) == 0
        imagesc(T);
        colorbar;
        title(sprintf('Temperature field at t = %d', t));
        drawnow;
    end
end
