% hw06.m          -
% Daniel Ketterer -
% MTH 6150        -
clear all;
%%%Problem 1
fun = @(x) (x-1)*exp(-x^2);
a = 10;
b = 40;
tol = 1e-05;
kmax = 10000;
[xmin ,fmin ,iter ] = golden(fun, a, b, tol, kmax)
clear all;
%%%Problem 2
Ffun = @(x1,x2) x1^4+x1*x2+(1+x2)^2;
nmax = 10000;
%[x,F,iter] = newtonsys(Ffun, Jfun, x0 ,tol, nmax, varargin)
%%%Problem 3
%[x,err ,iter ]= descent (fun ,grad ,x0 ,tol ,kmax ,meth ,varargin )
