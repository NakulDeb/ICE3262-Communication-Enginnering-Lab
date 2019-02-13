% University of Rajshahi
% Name : Nakul Deb Nath
% Dept : CSE
% Date : 17-11-2018

clear;
clear all;
clc;

n=[1 1 0 0 0 0 0 0 0 0 1 1];
%n = input('Enter the bit Stream : ');

v = 3;
for index = 1:length(n)
    if n(index)==1;
        bitsArray(index) = v;
        v = -v;
    else
        bitsArray(index) = 0;
    end
end

i=1;
t = 0:0.001:length(n);
bt = 1/0.001;
for index = 1:length(t)
    if t(index) <= i;
        y(index)=bitsArray(i);
    else
        y(index) = bitsArray(i);
        i = i+1;
    end
end
plot(t,y);
%axis([0 length(n) -5 5]);
%grid on;
%title('AMI');

axis([0 length(n) -5 5]);
set(gca,'YTick', [-3 0 3])
set(gca,'XTick', 1:length(n))
title('AMI B8ZS')
hold on;
grid on;



for j = 1:length(y)/bt
    if y(j*bt) == v;
        resiveBit(j) = 1;
    elseif y(j*bt) == -v
        resiveBit(j) = 1;
    else
        resiveBit(j) = 0;
    end
end

display(resiveBit);
