% quick plot of input maps 

clear;
clc;
close all;

n=100

x = linspace(1,n,n);
y = linspace(1,n,n);
z = meshgrid(x,y);

co_matrix =[
     1    100    1    100     1   
     20   80    20    80     8   
    76    80    48    49     9  
    74    76    49    50     9 
    78    79    49    50     9   
    77    78    50    51     9   
    76    77    51    52     9 
    78    79    47    48     9   
    78    79    46    47     9   
    77    78    45    46     9   
    76    77    45    46     9   
];

factor= 1;
co_matrix_new=round([co_matrix(:,1:4)*factor,co_matrix(:,5)])


end_loop =size(co_matrix,1);

figure;
% spy(z);hold on;
for i = 1:end_loop
lx=co_matrix_new(i,1);ux=co_matrix_new(i,2);ly=co_matrix_new(i,3);uy=co_matrix_new(i,4);
costr='k-';plot_c;
end
% p1=quick_square(lx,ux,ly,uy);
% plot(p1(:,1),p1(:,2),'r-');
xlim([1,n*factor]);
ylim([1,n*factor]);

