% quick plot of input materials  

clear;
clc;
close all;


[status,sysHOME] = system('printf "$HOME"');

libpath = strcat(pwd, '/functions')
addpath(libpath);




% folder_for_para="4linear_array/";
% addpath(folder_for_para);


numMat=7;

mat_numbering_col = 1:numMat
default_numbering_col = ones(1,numMat)
density_numer = [1000,ones(1,numMat-1)*8076.9]
% factorvp = [1,1.0072, 0.9706,0.9876,1.0476,1.0640,1];
% factorvs = [1,1.0072, 0.9706,0.9876,1.0476,1.0640,1];
factorvp = [1,1.01, 0.97,0.985,1.05,1.07,1];
factorvs = 1+(factorvp - ones(1,numMat))*2.5;factorvs(end)=1;
vp_numer = factorvp .* [1479.7,ones(1,numMat-1)*5997.2]
vs_numer = factorvs .* [0,ones(1,numMat-1)*3205.6d0];



for i = 1:numMat

[den1,den2]=split_digits(density_numer(i));
[vp1,vp2]=split_digits(vp_numer(i));
[vs1,vs2]=split_digits(vs_numer(i));


matarray = sprintf('%01d %01d %04d.%01dd0 %04d.%01dd0 %04d.%01dd0 0 0 10.d0 10.d0 0 0 0 0 0 0',...
    mat_numbering_col(i),default_numbering_col(i),den1,den2,vp1,vp2,vs1,vs2);

display(matarray(1:end) )


end
% 

% % % ke.try = ones(1,numMat);
% % % % ke.den=zeros(1,numMat)
% % % for i = 1:numMat
% % % 
% % %     ke.den(1,i) = {sprintf('SOURCE_%06d',i)};
% % % 
% % % end
% % % 
% % % ke.try
% % % string(ke.den)
% % % string(ke.den)

 