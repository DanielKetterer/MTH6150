%hw02.m
%Problem 4
A = [1 1 0 3;2 1 -1 1;3 -1 -1 2;-1 2 3 -1];
lufactor(A)
eps=.5e-15;
B = [1 1+eps  3;2 2 20 ;3 6 4];

a = [0 0 0 15 15];
n=4;
while  n<3000 && 1- isequal(a, [0 0 0 0 1])
 n=n+1;
 a(1)= mod( a(2), 16);
 a(2)= mod( a(3), 16);
 a(3)= mod( a(4), 16);
 a(4) = a(5);
 a(5) = 0;
 a(4) = mod(a(4) - a(1),16);
 a(5) = mod(a(5) - a(1),16);
 a(1)=0;
 n
 a
end
