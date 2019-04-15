% hw05.m          -
% Daniel Ketterer -
% MTH 6150        -


%%%Problem 3
A = [ 4 1 1 1; 1 3 -1 1; 1 -1 2 0; 1 1 0 2];

disp("3a Answer: ");
tol =1.d-5; x0 = [1 1 1 1]'; nmax = 100;
[lambda, x, iter] = eigpower(A,tol,nmax,x0);
lambda
disp("3b Answer: ");
mu = 1;
[lambda, x, iter] = invshift(A, mu, tol, nmax, x0);
lambda
disp("3c Answer: ");
[lambda,v,iter]=RayQ(A,tol,nmax,x0);
lambda
clear all;

%%%Problem 5
A = [ 3 1 0; 1 4 2; 0 2 3];

tol =1.d-5; nmax = 500;
disp("5a Answer: eigenvalues are the components of D: ");
D = qrbasic(A, tol, nmax)
x0 = [1 1 1 ]';
disp("5b Answer: eigenvectors correspond to the eigenvalues in 5a ");

for i = 1 : 3
 mu = D(i)+tol;
[lambda, x, iter] = invshift(A, mu, tol, nmax, x0);
x
end
%%%
% 3a Answer: 
% 
% lambda =
% 
%     5.2360
% 
% 3b Answer: 
% 
% lambda =
% 
%     0.7639
% 
% 3c Answer: 
% 
% lambda =
% 
%     4.2500
% 
% 
% lambda =
% 
%     5.2361
% 
% 5a Answer: eigenvalues are the components of D: 
% The method converges in 21 iterations
% 
% D =
% 
%     5.7913
%     3.0000
%     1.2087
% 
% 5b Answer: eigenvectors correspond to the eigenvalues in 5a 
% 
% x =
% 
%     0.2796
%     0.7805
%     0.5592
% 
% 
% x =
% 
%     0.8944
%     0.0000
%    -0.4472
% 
% 
% x =
% 
%     0.3490
%    -0.6252
%     0.6981