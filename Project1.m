% 2 D effect of radiation and convection inside a hollow box with  surface constant suface temperature

% Parameters
Lx = 0.5;           % Length of the box in meters
Ly = 0.5;           % Height of the box in meters
Nx = 50;            % Number of grid points in x-direction
Ny = 50;            % Number of grid points in y-direction
dt = 0.1;         % Time step in seconds (reduce for stability)
t_final = 50;       % Final simulation time in seconds
U = 0;            % Velocity in x-direction (m/s)
V = 0;            % Velocity in y-direction (m/s)
T_initial = 25;     % Initial temperature (°C)
T_wall = 200;       % Wall temperature (°C)
alpha = 1e-5;       % Thermal diffusivity (m^2/s)

% Grid spacing
dx = Lx / (Nx - 1);
dy = Ly / (Ny - 1);

% Initialize temperature matrix
T = ones(Nx, Ny) * T_initial;

% Set boundary conditions
T(:, 1) = T_wall;           % Left wall temperature boundary
T(:, end) = T_wall;         % Right wall temperature boundary
T(1, :) = T_wall;           % Bottom wall temperature boundary
T(end, :) = T_wall;         % Top wall temperature boundary

% Main loop for time stepping
t = 0;
while t < t_final
    % Calculate temperature at next time step using finite difference method
    T_new = T;
    for i = 2:Nx-1
        for j = 2:Ny-1
            % Internal nodes
            % Upwind scheme for the convective terms
            dTdx = (T(i,j) - T(i-1,j)) / dx;
            dTdy = (T(i,j) - T(i,j-1)) / dy;
            if U > 0
                dTdx = (T(i+1,j) - T(i,j)) / dx;
            end
            if V > 0
                dTdy = (T(i,j+1) - T(i,j)) / dy;
            end
            % Calculate temperature at next time step
            T_new(i, j) = T(i, j) + alpha * dt * ((T(i+1, j) - 2*T(i, j) + T(i-1, j))/dx^2 + ...
                         (T(i, j+1) - 2*T(i, j) + T(i, j-1))/dy^2) - ...
                         U * dt * dTdx - ...
                         V * dt * dTdy;
        end
    end
    % Update temperature
    T = T_new;

    % Increment time
    t = t + dt;
    
    % Plot temperature contour
    contourf(T', 'Fill', 'on');
    colorbar;
    xlabel('x (grid points)');
    ylabel('y (grid points)');
    title(['Temperature at t = ', num2str(t), ' s']);
    axis equal;
    drawnow;
end
