% hw03.m          -
% Daniel Ketterer -
% MTH 6150        -


%%% Problem 1

%%Part a in attached file lsqfit.m
%%-

% Inputs
Partition = 101; 
n=7;
t = linspace(0,1,Partition);
b = (.05*sin(1000*t)+.5*cos(pi*t)-.4*sin(10*t))'; % b is a column vector
diff = [];
%-

%Initialize Plot
plot(t,b)
title('First 7 least squares fits')
hold on
%-


%%Part b
for i =1:n
[A,x] = lsqfit(i,t,b);
plot(t,A*x)
diff = [diff A*x-b];
end
%%-

%%Part c
legend('Original','0 degree', '1 degree', '2' , '3' , '4' , '5' , '6' );
hold off
%%-
figure;
hold on
%%Part d
plot(t,diff)

title('Difference between least squares fits')
legend('0 degree','1 degree', '2' , '3' , '4' , '5' , '6' );
hold off
err = sum(diff , 1)
abserr = sum (abs(diff) , 1)
sqrerr = sum (diff.*diff , 1)
% The output is err = 1.0e-11 *
%   0.0006   -0.0002    0.0000   -0.0001   -0.0045   -0.0298   -0.3761
%
% abserr =
%   39.1087   24.8393   22.7733   21.0506    7.4872    6.6530    3.3216
%
% sqrerr =
%
%   19.1749    8.0496    6.8779    5.5946    0.7903    0.6147    0.1442
%
% So  in terms of overall error where positive errors cancel out negative
% errors, the third row or the sum(diff(:,3),1) = 3.3307e-16 which is tiny, 
% however when you look at its graph, this quadratic poorly approximates 
% the function, overall error notwithstanding.
%
% Using either the absolute error or squared error measures we can get a
% better idea of which functions are actually good approximations. By about
% the 4th order we have almost an order of magnitude change in both
% absolute and squared error functions. The best approximation comes at the
% final 6th order polynomial. By inspection of the graph the 4th, 5th, and
% 6th order polynomial approximations seeem to be close to the graph and
% good approximations.
%
%
%
%%-
%%%-


%%%Problem 2

%%Part a
%The function c_1*exp(c_2*t) is not a polynomial nor a linear combination
%of elements so none of the linear algebra we learned can be applied to it,
%since that assumes we can form a linear combination of polynomials with
%some coefficients c_i and apply it to a Vandermonde matrix to approximate
%value of the function. However it can be made linear with a logarithmic
%transformation.
%%-

%%Part b
start = 0; % determined by given dataset
stop = 2;  % determined by given dataset
n = 2;     % 1st order linear polynomial
m = 3;     % determined by given dataset 3 test points
t = linspace(start,stop,m) ; % determined by above
c = [ .1, .9, 2]';  % determined by given dataset c_i = ln(w_i)
[A,x] = lsqfit(n,t,c);
c_1 = exp( x(1) )
%c_1 returns  1.0513

c_2 = x(2)
%c_2 returns  0.9500

u = @(x) c_1*exp(c_2*x); %anonymous representation of u
u(t)
% u(t) returns    1.0513    2.7183    7.0287 for u(0) u(1) u(2) data
% respectively,
% data given was  1.1052    2.4596    7.3891 so they are comparable
%%-

%%%-

