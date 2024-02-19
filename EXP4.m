L=1;
Nx=7;
dx=L/(Nx-1);
% k = 1;
Q = 0;
A = zeros(Nx,Nx);
A(1,1) = 2;
A(Nx,Nx)=2;
A(7,6)=-1;
for i = 2:Nx-1
    A(i,i-1) =-1;
    A(i,i) = 2;
    A(i,i+1) =-1;
    A(i-1,i) = -1;
    
end

b = zeros(Nx,1);
x = linspace(0,L,Nx);
[L,D] = eig(A);
S = diag(D);

I = eye(7);
I(1,1) = S(1,1);
I(7,7) = S(7,1);
for i = 2:7
    I(i,i) = S(i,1);
end
T = A./I;
t = diag(T);
disp(t)
plot(x,t);
