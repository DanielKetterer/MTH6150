function [x,F,iter] = newtonsys(Ffun, Jfun, x0 ,tol, nmax, varargin)
%NEWTONSYS find a zero of a nonlinear system
% [ZERO ,F,ITER ]= NEWTONSYS(FFUN ,JFUN ,X0 ,TOL ,NMAX)
% tries to find the vector ZERO , zero of a nonlinear
% system defined in FFUN with jacobian matrix defined
% in the function JFUN , nearest to the vector X0.
   iter = 0; err = tol + 1; x = x0;
   while err > tol & iter <= nmax
       J = feval(Jfun ,x,varargin {:});
       F = feval(Ffun ,x,varargin {:});
       delta = - J\F;
       x = x + delta;
       err = norm(delta );
       iter = iter + 1;
   end
   F = norm(feval(Ffun ,x,varargin {:}));
   if iter >= nmax
       fprintf('Fails to converge within maximum number of iterations\n ');
       fprintf(' The iterate returned has relative residual %e\n', F);
   else
       fprintf(' The method converged at iteration, %i with a residual %e \n',iter ,F);
   end
   return
