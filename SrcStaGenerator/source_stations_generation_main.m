%%

clear;clc;close all; 
% load the library for source_station_file_generation
format long;

[status,sysHOME] = system('printf "$HOME"');

libpath = strcat(sysHOME, '/Desktop/alljh/pfiles/my_matlab_lib/try_matlab_module/array_gen_sp2d')
% libpath = strcat('/media/jhe26/DATA/databk/AKcode/AKmatlab/Ryan_Moreno_Code20200626/array_gen_sp2d/array_gen_sp2d')
addpath(libpath);

folder_for_para="2D/4linear_array/";
addpath(folder_for_para);

%%% par_para was called from the folder of 'folder_for_para';

flag_load_para= 2ls
% 1 for loading, 2 for not 11 for 3D gen
flag_plot = 1 
num_scan_posi = 1 % 23
src_num_spc = 1

switch flag_load_para 
    case 1
        k_num = 0
        for k = 8 %1:7:16 %l = 1;
            k_num = k_num+1
        for i = 1:num_scan_posi
            filename = sprintf('obsFan%02d_SRC%02d_para.mat',i,k);
            eval(['load ', filename, ' mystation';]);
            par_para;
            stations_generation;
            source_generation;
            plot_source_stations;
        end
        end
        
        matrix_events = 1:num_scan_posi*src_num_spc;
        source_station_selection;
        
    case 2 
        par_para;
        stations_generation;
        source_generation;
        
        if flag_source_shape==80
           create_plot_source_stations_Ryan(src) 
        end
    case 11 
        par_para;
        source_generation3D;
        stations_generation3D;   
end



% figure;scatter(SRCtemp.SrcPos(:,1),SRCtemp.SrcPos(:,2))

% rmpath(libpath,folder_for_para)
