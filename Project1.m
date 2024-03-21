% 2 D effect of radiation inside a box with outside surface at constant
% temperature

% initial parameter to be set for simulation
Lx = 0.5; % length of the box in meter
Ly = 0.5; % breadth of the box in meter
Nx = 50; % grid division in the x direction
Ny = 50; % grid division in the y direction
e = 0.8; % emmissivity of the box material
sigma = 5.67e-8; % stefan boltzmans constant
a = 1.2e-5; % thermal diffusivity of the material used in the plate
t = 50; % total simulation time in sec
dt = 0.1; % time step in sec
T_initial = 25; %initial temperature condition in degree celcius

%boundary condition
T_boundary = 100; %Boundary temperature in degree celcius

% discretization of the mesh
dx = Lx/(Nx-1); % grid spacing in the x direction
dy = Ly/(Ny-1); %grid spacing in the y direction

% setting the coordinate system
x = linspace(0,Lx,Nx); % for x coordinates
y = linspace(0,Ly,Ny); % for y coordinates

%initializing the initial and boundary condition
T = ones(Nx, Ny) * T_initial; % Initial temperature distribution
T(1,:) = T_boundary;           % Boundary condition at y = 0
T(:,1) = T_boundary;           % Boundary condition at x = 0
T(50,:) = T_boundary;
T(:,50) = T_boundary;

% Loop
for t = 1:round(t / dt)
    % Calculate new temperature distribution using finite difference method
    T_new = T;
    for i = 2:Nx-1
        for j = 2:Ny-1
            % Internal nodes
            T_new(i,j) = T(i,j) + a * dt * ((T(i+1,j) - 2*T(i,j) + T(i-1,j))/dx^2 + ...
                         (T(i,j+1) - 2*T(i,j) + T(i,j-1))/dy^2) + ...
                         e * sigma * dt * T(i,j)^4;
        end
    end
% setting the final value of temperature
T = T_new;

% 2D plotting of temperature contour
contourf(x, y, T', 'Fill', 'on');
    colorbar;
    xlabel('x (m)');
    ylabel('y (m)');
    title(['Temperature Contour at t = ', num2str(t*dt), ' s']);
    axis equal;
    drawnow;
end