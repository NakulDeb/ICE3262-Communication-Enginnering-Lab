% University of Rajshahi
% Name : Nakul Deb Nath
% Dept : CSE
% Date : 05-09-2018

clear all;
close all;
clc;

f=input('Enter frequency');
%T=1/f;
fs1=input('Enter the sampling frequency');

t=0:0.1:100;
t1=0:10:500;

x=sin(2*3.14*f*t);
%2*pi*f*t 
subplot(2,1,1); 
plot(t,x); 

y=sin(2*3.14*f*t1/fs1); 
subplot(2,1,2); 
stem(t1,y);