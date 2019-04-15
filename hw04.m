% hw04.m          -
% Daniel Ketterer -
% MTH 6150        -

%%%Problem 5
tol = 1.d-6;
erresults =[];
itresults =[];
tresults =[];
for n = 4:2:14
    x0 = zeros(n,1);
    A= hilb(n);
    P = diag(diag(A));
    x_n = ones(n,1);
    b_n = A*x_n;
    r = b_n-A*x0;
    r0 = norm(r);
    tic
    [x1,iterG,err1] = itermeth(A,  b_n,  x0,  4000,  tol, 'G');
    t1=toc;
    tic
    [x2,iterP,err2] = itermeth(A,  b_n,  x0,  4000,  tol, P);
    t2=toc;
    tic
    x3 = A\b_n;
    t3=toc;
    r  = b_n - A * x3; 
    err3= norm(r)/r0;
    
    erresults=[erresults;err1,err2,err3];
    itresults=[itresults;iterG,iterP,1];
    tresults=[tresults;t1,t2,t3];
end

erresults % error results
itresults % iteration number results
tresults  % time results (not asked for but relevant)
% 
% 
% 
% erresults =
% 
%    1.0e-06 *
% 
%     0.9998    0.9997    0.0000
%     0.9954    0.9994    0.0000
%     0.9997    0.9958    0.0000
%     0.9990    0.9989    0.0000
%     0.9986    0.9987    0.0000
%     0.9992    0.9980    0.0000
% 
% 
% itresults =
% 
%         2096         995           1
%          918        1813           1
%         2397        1089           1
%         2119         875           1
%         1636        1355           1
%         1304        1379           1
% 
% 
% tresults =
% 
%     0.0102    0.0042    0.0001
%     0.0023    0.0056    0.0001
%     0.0066    0.0044    0.0001
%     0.0048    0.0024    0.0001
%     0.0049    0.0041    0.0007
%     0.0033    0.0041    0.0005
%%%



