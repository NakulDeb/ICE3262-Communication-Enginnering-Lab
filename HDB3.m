% University of Rajshahi
% Name : Nakul Deb Nath
% Dept : CSE
% Date : 27-11-2018

clear;
clear all;
clc;

n=[1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 1];
%n = input('Enter the bit Stream : ');

v = 3;
v1 = 3;
count = 0;
countOnes = 0;
for index = 1:length(n)
  
    if n(index)==1;
        bitsArray(index) = v;
        v = -v;
        count = 0;
        countOnes = countOnes+1;
    else
        bitsArray(index) = 0;
        count = count + 1;
        if count == 4
            count = 0;
            if rem(countOnes,2) == 0
                bitsArray(index-3) = v;
                bitsArray(index-2) = 0;
                bitsArray(index-1) = 0;
                bitsArray(index) = v;
                countOnes = countOnes + 2;
                v = -v;

            else
                bitsArray(index-3) = 0;
                bitsArray(index-2) = 0;
                bitsArray(index-1) = 0;
                bitsArray(index) = -v;
                countOnes = countOnes + 1;
               % v = -v;

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


plot(t,y, 'LineWidth', 1);
axis([0 length(n) -5 5]);
set(gca,'YTick', [-3 0 3])
set(gca,'XTick', 1:length(n))
title('HDB3')
hold on;
grid on;





v = 3;
v1 = -v;

for j = 1:length(y)/bt
    if v1 == y(j*bt)
        resiveBit(j) = 0;
        resiveBit(j-1) = 0;
        resiveBit(j-2) = 0;
        resiveBit(j-3) = 0;
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
