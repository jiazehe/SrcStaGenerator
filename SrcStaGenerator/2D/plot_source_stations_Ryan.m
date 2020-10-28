
%%%%%%%%%%% Plot and Picture Creation %%%%%%%%%%%%%%%%%%%%%

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
src.name_of_source_folder = name_of_source_folder;  
src.name_of_source_file = name_of_source_file;


switch flag_source_shape
    
    case 80
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

create_plot_source_stations_Ryan(src)

%%%%%%%%%%% Plot and Picture Creation %%%%%%%%%%%%%%%%%%%%%
