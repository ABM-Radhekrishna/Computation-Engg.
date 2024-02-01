% 1d Steady State conduction
l = 2; % in meters
dx = 0.1; % in meters
N = l/dx + 1; % number of nodes
Tolerance = 1e-4;
dt = 0.00015; % time stamp

%domain Discretisation
T_new = zeros(1,N);
%matrix coordionate system
x = linspace(0,1,N); % used for filling the values equally (x,y,z) where x and z are the starting and ending corrdinates and y is the values which needs to be equally divided and assigned the values

%intial condition
T_new (1,1) = 250;
T_new (1,N) = 100;

% Loop Logic
error = 1; iter = 0;
while (error > Tolerance)
    iter = iter+1;
    T = T_new ;
    for i = 2:N-1 ;
        T_new(i) = ((T(i-1)+T(i+1))/2) ;
    end
    error = max(abs(T - T_new));
    figure(2)
    %plotting the results
    plot(T_new); shading flat; colorbar;
    xlabel('Temperature')
    pause(0.00001); % pause between each iteration
end
