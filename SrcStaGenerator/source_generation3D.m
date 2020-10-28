
    src.flag_source_shape = flag_source_shape;
    src.flag_src_diff_stfs = flag_src_diff_stfs;
    src.matrix_s_num = matrix_s_num;
    src.folder_for_para = folder_for_para;
    src.f0 = f0;
    
    
    src.name_of_source_folder = name_of_source_folder;  % '/home/jiazeh/csp2d_base/DATA/sources/';
    src.name_of_source_file = name_of_source_file;  %  '/home/jiazeh/csp2d_base/DATA/sources/ricker_3src/line/0001';

    
%     for i_num = 1:length(src.matrix_s_num)


% % tempx = 0.04
% % tempy = 0.05
% % tempz = 0.025
switch flag_source_shape
    case {153,154}
    src.x_center = src_x_center;
    src.y_center = src_y_center;
    src.z_center = src_z_center;
   
    src.transducer_number=transducer_number;
    src.transducer_number2=transducer_number2;
    src.transducer_number3=transducer_number3;
    
    src.transducer_length=transducer_length;
    src.transducer_length2=transducer_length2;
    src.transducer_length3=transducer_length3;
    
    src.delta_length = sdeltaL;
    src.delta_length2 = sdeltaL2;
    src.delta_length3 = sdeltaL3;
end
        


Srctemp = create_SOURCE3D(src);


        
% % % % s_num = src.matrix_s_num(i_num);    
% % % % source_filename = sprintf('SOURCE_%06d',s_num-1);
% % % % parafullpath=strcat(src.folder_for_para,source_filename);
% % % % fileID = fopen(parafullpath,'w');
% % % % 
% % % % name_of_source_file_str = sprintf('name_of_source_file          =  %s%04d \n',src.name_of_source_folder,s_num-1);
% % % % 
% % % % fprintf(fileID,'FORCE  0\n');
% % % % fprintf(fileID,'time shift:      0.0000 \n');
% % % % fprintf(fileID,'f0 = %6.3f \n',src.f0);
% % % % 
% % % % xs_str = sprintf('latorUTM: %6.5f \n', tempx);
% % % % fprintf(fileID,xs_str);
% % % % ys_str = sprintf('longorUTM: %6.5f \n', tempy);
% % % % fprintf(fileID,ys_str);
% % % % zs_str = sprintf('depth: %6.5f \n', tempz);
% % % % fprintf(fileID,zs_str);
% % % % fprintf(fileID,'factor force sources:             1.d0 \n');
% % % % fprintf(fileID,'component dir vect source E:      0.d0 \n');
% % % % fprintf(fileID,'component dir vect source N:      0.d0 \n');
% % % % fprintf(fileID,'component dir vect source Z_UP:   1.d0 \n');
% % % % fprintf(fileID,name_of_source_file_str);
% % % % 
% % % % fclose(fileID);


%     end
    
% % % stations.folder_for_para = folder_for_para;
% % % stations.flag_source_shape = flag_station_shape;
% % % stations.matrix_s_num = matrix_s_num;
% % % 
% % % 
% % % switch flag_station_shape
% % %     case{153}
% % %     % r is the length of the linear array 
% % %     stations.x_center = rec_x_center;
% % %     stations.y_center = rec_y_center;
% % %     stations.z_center = rec_z_center;
% % %     stations.transducer_number = receiver_number;
% % %     stations.transducer_number2 = receiver_number2;
% % %     stations.transducer_number3 = receiver_number3;
% % %  
% % %     stations.transducer_length = receiver_length;
% % %     stations.transducer_length2 = receiver_length2;
% % %     stations.transducer_length3 = receiver_length3;
% % %     stations.delta_length = rdeltaL;
% % %     stations.delta_length2 = rdeltaL2;
% % %     stations.delta_length3 = rdeltaL3;
% % % end
% % % 
% % % Rectemp = create_STATIONS3D(stations);
