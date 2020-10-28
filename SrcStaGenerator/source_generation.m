
%%%%%%%%%%% SOURCE creation %%%%%%%%%%%%%%%%%%%%%

    src.flag_source_shape = flag_source_shape;
    src.flag_src_diff_stfs = flag_src_diff_stfs;
    src.matrix_s_num = matrix_s_num;
    src.transducer_number=transducer_number;
    src.source_center_x = source_center_x;
    src.source_center_y = source_center_y;
    src.f0 = f0;
    src.anglesource =anglesource;
    src.folder_for_para = folder_for_para;
    src.source_type = source_type;
    src.time_function_type = time_function_type;
    src.name_of_source_folder = name_of_source_folder;  % '/home/jiazeh/csp2d_base/DATA/sources/';
    src.name_of_source_file = name_of_source_file;  %  '/home/jiazeh/csp2d_base/DATA/sources/ricker_3src/line/0001';
switch flag_source_shape
    case 2
    %line source
    src.transducer_length=transducer_length;
    src.delta_length = transducer_length/(transducer_number -1);
    %src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/5pks_3srcs/';
    %% the following line is useful only if  flag_src_diff_stfs~=1
%     src.name_of_source_file = '/home/jiazeh/csp2d_base/DATA/sources/stf_5pks_dt48ns_dlst140_f300000';
    case 1
    %src.name_of_source_file = '/scratch/gpfs/jiazeh/inversion_test/specfem_data/sources/stf_ricker_small_delayed2';  
%     src.name_of_source_file = '/scratch/gpfs/jiazeh/specfem2d/DATA/sources/z2istf_trstar089_trenw090'; 
%     src.name_of_source_file = '/scratch/gpfs/jiazeh/csp2d_base/DATA/sources/z5istf_trstar089_trend090';  
    case 3 % points on a line
    src.transducer_length=transducer_length;
    src.delta_length = deltaL;
    src.transducer_number = 1;
    src.source_center_y = source_center_y + transducer_length2/2; 
    
    %src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/5pks_3srcs/';
%%
    case 4 % points on a circle
    src.r_src = r_src;
    src.x_center = rec_x_center;
    src.y_center = rec_y_center;
    src.N = length(matrix_s_num);
    src.delta_degree = 2*pi/src.N;
    
%     src.transducer_length=transducer_length;
    src.delta_length = transducer_length/(length(matrix_s_num) -1);
%     src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/12ricker_on_cir/';
%%
    case 5
    %circular sources 
    src.r_src = r_src;
    src.x_center = rec_x_center;
    src.y_center = rec_y_center;
    src.N =  transducer_number;
    src.delta_degree = 2*pi/src.N;
    
%     src.transducer_length=transducer_length;
%     src.delta_length = transducer_length/(transducer_number -1);
    src.flag_src_diff_stfs=flag_src_diff_stfs;
%     src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/12ricker_cir_iobs/';
      
    case 21
    %line source
    %src.transducer_length=transducer_length;
    %src.delta_length = transducer_length/(transducer_number -1);
    %%%src.name_of_source_file = '/home/jiazeh/specfem2d/DATA/stf_ricker_delayed';
    
    src.r = r;
    src.x_center = rec_x_center;
    src.y_center = rec_y_center;
    src.N = length(matrix_s_num);
    src.delta_degree = 2*pi/src.N;
%     src.name_of_source_file = '/scratch/gpfs/jiazeh/csp2d_base/DATA/sources/linear_src/ricker_';  
    case {31,32,33,34}
    %line source
    src.transducer_length=transducer_length;
    src.delta_length = transducer_length/(transducer_number);

    case {36}
    src.transducer_length=transducer_length;
    src.delta_length = transducer_length/(transducer_number-1);
    src.transducer_number2=transducer_number2; % for 36 only 
    src.transducer_length2=transducer_length2; % for 36 only 

%     src.name_of_source_file = '/home/jiazeh/specfem2d/DATA/stf_ricker_delayed';
%     src.name_of_source_file = '/home/jiazeh/csp2d_base/DATA/sources/stf_ricker_dt40ns_dlst200_f300000';
    case {53,54}
    src.x_center = source_center_x
    src.y_center = source_center_y
    src.transducer_number=transducer_number;
    src.transducer_number2=transducer_number2;
    src.transducer_length=transducer_length;
    src.transducer_length2=transducer_length2;
    src.delta_length = deltaL;
    src.delta_length2 = deltaL2;
%     src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/3_5pks_cir_iobs_9srcs/';
   
    case {71,73}
    src.x_center = source_center_x
    src.y_center = source_center_y
    src.transducer_number=transducer_number;
%     src.transducer_number2=transducer_number2;
    src.transducer_length=transducer_length;
    src.transducer_length2=transducer_length2;
    src.delta_length = deltaL;
    src.delta_length2 = deltaL2;
%     src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/4ricker_rect_iobs/';
   
    case {72,74}
    src.x_center = source_center_x
    src.y_center = source_center_y
    src.transducer_number=transducer_number2;
%     src.transducer_number2=transducer_number2;
    src.transducer_length=transducer_length;
    src.transducer_length2=transducer_length2;
    src.delta_length = deltaL;
    src.delta_length2 = deltaL2;
%     src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/4ricker_rect_iobs/';
  
    case {75}
    %individual sources
    src.x_center = source_center_x
    src.y_center = source_center_y
    src.transducer_number=transducer_number;
    src.transducer_number2=transducer_number2;
    src.transducer_length=transducer_length;
    src.transducer_length2=transducer_length2;
    src.delta_length = deltaL;
    src.delta_length2 = deltaL2;
    src.total_num = transducer_number *2 +transducer_number2*2 -4;
%     src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/4ricker_rect_iobs/';
        
    case {80}
    %Ryan_Moreno Test Source Generation
    src.x_center = source_center_x;
    src.y_center = source_center_y;
    src.r = r;
    src.d = d;
    src.matrix_s_num = matrix_s_num;
    src.Array_Total = Array_Total;
    src.angle_away = angle_away;
    src.theta_start = theta_start;
    src.Operating_Source_Points = Operating_Source_Points;
    


    
end
create_SOURCE(src);
% SRCtemp = create_SOURCE(src);
%%%%%%%%%%% SOURCE creation %%%%%%%%%%%%%%%%%%%%%

