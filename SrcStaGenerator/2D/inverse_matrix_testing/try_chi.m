clear;clc;close all;

x = -50:0.01:50; 
sigma = 1; 

chi = x.^2; 
p = 1/sigma/sqrt(2*pi)*exp(-x.^2/2./(sigma.^2));
y1 = chi2pdf(x,1)
y2 = chi2pdf(x,2)
y4 = chi2pdf(x,4)
y10 = chi2pdf(x,10)
figure
plot(x,y1, 'm'); hold on; 
plot(x,y2, 'k'); hold on; 
plot(x,y4, 'b'); hold on; 
plot(x,y10, 'r'); 

