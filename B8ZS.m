% University of Rajshahi
% Name : Nakul Deb Nath
% Dept : CSE
% Date : 27-11-2018

clear;
clear all;
clc;

n=[1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 1 1 0 ];
%n = input('Enter the bit Stream : ');

v = 3;
v1 = 3;
count = 0;
for index = 1:length(n)
  
    if n(index)==1;
        bitsArray(index) = v;
        v = -v;
        count = 0;
    else
        bitsArray(index) = 0;
        count = count + 1;
        if count == 8
            count = 0;
            if v < 0
                bitsArray(index-7) = 0;
                bitsArray(index-6) = 0;
                bitsArray(index-5) = 0;
                bitsArray(index-4) = v1;
                bitsArray(index-3) = -v1;
                bitsArray(index-2) = 0;
                bitsArray(index-1) = -v1;
                bitsArray(index) = v1;

            else
                bitsArray(index-7) = 0;
                bitsArray(index-6) = 0;
                bitsArray(index-5) = 0;
                bitsArray(index-4) = -v1;
                bitsArray(index-3) = v1;
                bitsArray(index-2) = 0;
                bitsArray(index-1) = v1;
                bitsArray(index) = -v1;

            end
        end
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
axis([0 length(n) -5 5]);
set(gca,'YTick', [-3 0 3])
set(gca,'XTick', 1:length(n))
title('B8ZS')
hold on;
grid on;




v = 3;
count = 0;
v1 = -v;
ck = 0;

for j = 1:length(y)/bt
    if ck == 1
        count = count + 1;
        if count == 4;
            count = 0;
            ck = 0;
        end
    elseif v1 == y(j*bt)
        resiveBit(j) = 0;
        resiveBit(j+1) = 0;
        resiveBit(j+2) = 0;
        resiveBit(j+3) = 0;
        resiveBit(j+4) = 0;
        ck = 1;
    elseif y(j*bt) == v;
        v1 = y(j*bt);
        resiveBit(j) = 1;
    elseif y(j*bt) == -v
        resiveBit(j) = 1;
        v1 = y(j*bt);
    else
        resiveBit(j) = 0;
    end
end

display(resiveBit);
