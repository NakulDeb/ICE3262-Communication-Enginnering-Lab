% University of Rajshahi
% Name : Nakul Deb Nath
% Dept : CSE
% Date : 10-10-2018

clear;
clear all;
clc;

n=[1,1,0,1,1,0,0];
%n = input('Enter the bit Stream : ');
v = 3;
for index = 1:length(n)
    if n(index)==1;
        bitsArray(index) = -v;
        v = -v;
    else
        bitsArray(index) = v;
    end
end

i=1;
t = 0:0.001:length(n);
bt = 1/0.001;
for index = 1:length(t)
    if t(index) == i;
        y(index)=bitsArray(i);
        i = i+1;
    else
        y(index) = bitsArray(i);
        
    end
end
plot(t,y);
axis([0 length(n) -5 5]);
grid on;
title('NRZ-I');





v = 3;
for j = 1:length(y)/bt
    
    if y(j*bt) == -v;
        resiveBit(j) = 1;
        v = -v;
    else
        resiveBit(j) = 0;
    end
end

display(resiveBit);
