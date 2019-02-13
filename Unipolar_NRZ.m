% University of Rajshahi
% Name : Nakul Deb Nath
% Dept : CSE
% Date : 19-09-2018

clear;
clear all;
clc;

n=[1,1,0,1,1,0,0];
%n = input('Enter the bit Stream : ');

i=1;
t = 0:0.001:length(n);
bt = 1/0.001;
v = 3;

for index = 1:length(n)
    if n(index)==1;
        bitsArray(index) = v;
    else
        bitsArray(index) = 0;
    end
end

for j = 1:length(t)
    if t(j) <= i;
        y(j)=bitsArray(i);
    else
        y(j) = bitsArray(i);
        i = i+1;
    end
end
plot(t,y);
axis([0 length(n) -5 5]);
grid on;
title('UNIPOLAR NRZ');





for j = 1:length(y)/bt
       if y(j*bt) == v;
           resiveBit(j) = 1;
       else
           resiveBit(j) = 0;
       end
end

display(resiveBit);

