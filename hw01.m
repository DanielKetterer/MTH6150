%hw01.m
%Problem 5

%%Part a
num = .5;                 % can be hard-coded to an integer to avoid prompt
disp('Please enter a positive integer')
while isnan(num) || fix(num) ~= num || num <= 0     % get user input
 
    num = str2double(input('Enter a positive integer: ','s'));
  
end
disp(PiApproxN(num));

%%Part b
n = 0;
sum = 0;
NextTerm = 0;
while sum ~= 3.141592653589793
    
    NextTerm = ((16)^(-n))*((4)/(8*n+1)-(2)/(8*n+4)-(1)/(8*n+5)-(1)/(8*n+6));
    
    sum = sum + NextTerm;
    
    n = n + 1;
end
disp(n);
disp('n value for which the approx equals 3.141592653589793'); 
%display the value of n at which sum approximation = 3.141592653589793


%Problem 6

%%Part a 
PartitionNum = 501; % Number of Partitions
t = linspace(0,1,PartitionNum); % independent var x
gd = exp(-t).*(sin(2*pi*t)+2);

%%Part b
gs = single(gd);

%%Part c
diff = gd - gs;
plot(t,diff);
title('error in sampling exp(-t)(sin(2*pi*t)+2) in single precision')
xlabel('t')
ylabel('round-off error')
%Picture is attached below