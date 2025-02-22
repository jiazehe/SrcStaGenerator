% quick plot of input maps 

clear;
clc;
close all;

folder_for_para="functions/";
addpath(folder_for_para);

n=40

x = linspace(1,n,n);
y = linspace(1,n,n);
z = meshgrid(x,y);

co_matrix =[
1 50 1 50  1
17 27 18 28  2
22 25 24 36  3
27 29 17 23  4
20 32 32 34  6
25 29 25 30  5
14 17 20 25  4
30 32 29 31  2
30 32 26 28  3
30 32 23 25  4
30 32 20 22  6
30 32 29 31  4
27 30 30 35  5
];

factor= 0.8;
co_matrix_new=round([co_matrix(:,1:4)*factor,co_matrix(:,5)])


end_loop =11;

figure;
% spy(z);hold on;
for i = 1:end_loop
lx=co_matrix_new(i,1);ux=co_matrix_new(i,2);ly=co_matrix_new(i,3);uy=co_matrix_new(i,4);
costr='k-';plot_c;
end
% p1=quick_square(lx,ux,ly,uy);
% plot(p1(:,1),p1(:,2),'r-');
xlim([1,n]);
ylim([1,n]);
% xlim([1,n*factor]);
% ylim([1,n*factor]);

