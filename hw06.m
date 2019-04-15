% hw06.m          -
% Daniel Ketterer -
% MTH 6150        -

%%%Problem 1
clear all;
fun = @(x) (x-1).*exp(-x.^2);
t = linspace(-10,10,2000);
plot(t,fun(t))
a = -1;
b = 0;
tol = 1e-08;
kmax = 10000;
[xmin ,fmin ,iter ] = golden(fun, a, b, tol, kmax)

%%%Problem 2
clear all;
Ffun = @(x) x(1).^4+x(1)*x(2)+(1+x(2)).^2;
Jfun = @(x) [4*x(1).^3+x(2);x(1)+2*(1+x(2))];
Hfun = @(x) [12*x(1).^2, 1; 1, 2];
nmax = 100000;
tol = 1e-08;
x0 =[.75;-1.25];
[x,F,iter] = newtonsys(Jfun,Hfun, x0 ,tol, nmax)
Ffun(x)
x0 =[0;0];
[x,F,iter] = newtonsys(Jfun,Hfun, x0 ,tol, nmax)
Ffun(x)
[X,Y] = meshgrid(-3:0.1:3,-6:6);
Z = X.^4+X.*Y+(1+Y).^2;
surf(X,Y,Z)

%%%Problem 3
clear all;
fun=@(x)100*(x(2)-x(1)^2)^2+(1-x(1))^2;
grad=@(x) [-400*x(1)*x(2)+400*x(1)^3+2*x(1)-2;200*x(2)-200*x(1)^2]
x0 =[-1.2;1];
tol = 1e-08;
kmax = 10000;
method = 1;
Hess =@(x) [-400*x(2)+1200*x(1)^2+2,-400*x(1);-400*x(1),200];
H=Hess(x0);
[x,err ,iter ]= descent (fun ,grad ,x0 ,tol ,kmax ,method,Hess )
method = 2;
[x,err ,iter ]= descent (fun ,grad ,x0 ,tol ,kmax ,method,H )
method = 3;
[x,err ,iter ]= descent (fun ,grad ,x0 ,tol ,kmax ,method )
method = 42;
[x,err ,iter ]= descent (fun ,grad ,x0 ,tol ,kmax ,method )
