% University of Rajshahi
% Name : Nakul Deb Nath
% Dept : CSE
% Date : 12-10-2018

clear;
clear all;
clc;

n=[1,1,0,1,1,0,0];
%n = input('Enter the bit Stream : ');
v = 3;
for index = 1:length(n)
    if n(index)==0;
        bitsArray(index) = v;
    else
        bitsArray(index) = -v;
        v = -v;
    end
end







i=1;
t = 0:0.001:length(n);
bt = 1/0.001;
for index = 1:length(t)
    if t(index) < i;
        if t(index) <= i-.5;
            y(index) =  -bitsArray(i);
        else
            y(index) = bitsArray(i);
        end
    else
        if t(index) <= i+.5;
            y(index) = bitsArray(i);
        else
            y(index) =  -bitsArray(i);
        end
        i = i+1;
    end
end


plot(t,y);
axis([0 length(n) -5 5]);
grid on;
title('DIFFERENTIAL MANCHESTER');



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

