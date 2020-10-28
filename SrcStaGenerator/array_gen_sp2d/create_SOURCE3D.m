

function [Rec] = create_SOURCE3D(src)

%% generate the arrays necessary to create the values in STATIONS file for specfem2d 
% src naming was a bit confusing: should be stations. 
% src=stations
switch src.flag_source_shape
    case {153,154}    
         for iact_x = 1:src.transducer_number      % each row 
            for iact_y = 1:src.transducer_number2 % each col
                for iact_z = 1:src.transducer_number3 % each col
                s_num = (iact_z + (iact_y-1) * src.transducer_number3 ...
                    +(iact_x-1)*(src.transducer_number2*src.transducer_number3));   
                 tempx=src.x_center - 0.5*src.transducer_length ...
                 + src.delta_length * (iact_x - 1);
                 tempy=src.y_center - 0.5*src.transducer_length2 ...
                 + src.delta_length2 * (iact_y - 1); 
                 tempz=src.z_center - 0.5*src.transducer_length3 ...
                 + src.delta_length3 * (iact_z - 1);
                 Rec.RecPos(s_num,1)=tempx;
                 Rec.RecPos(s_num,2)=tempy;
                 Rec.RecPos(s_num,3)=tempz;
               end
%              SOURCE_FILE_standard;
            end  % for iact_col = 1:src.transducer_number2 % each col        
        end % for iact_row = 1:src.transducer_number      % each row 
end % switch src.flag_station_shape


% % % if src.flag_source_shape ~= 154
% % %     m=length(Rec.RecPos(:,1));
% % %     sen_col = 0:m-1;
% % % end
%     m = length(src.matrix_s_num);
    
if or(src.flag_source_shape == 153,src.flag_source_shape == 154)
    
    if src.flag_source_shape == 154
    % open source file name for many point sources for one file 
        source_filename = sprintf('FORCESOLUTION_%06d',0);
        parafullpath=strcat(src.folder_for_para,source_filename)
        fileID = fopen(parafullpath,'w');
    end
    
    for iact_x = 1:src.transducer_number      % each row 
        for iact_y = 1:src.transducer_number2 % each col
            for iact_z = 1:src.transducer_number3 % each col
                s_num = (iact_z + (iact_y-1) * src.transducer_number3 ...
                   +(iact_x-1)*(src.transducer_number2*src.transducer_number3));   
                if src.flag_source_shape == 153
                    source_filename = sprintf('FORCESOLUTION_%06d',s_num-1);
                    parafullpath=strcat(src.folder_for_para,source_filename)
                    fileID = fopen(parafullpath,'w');
                end
                if src.flag_src_diff_stfs ~= 1
                    name_of_source_file_str = sprintf('%s \n',src.name_of_source_file);
                elseif or(src.flag_source_shape == 3,src.flag_source_shape == 4) 
                    name_of_source_file_str = sprintf('%s%04d \n',src.name_of_source_folder,(i_num-1));
                elseif or(src.flag_source_shape == 2,src.flag_source_shape == 5)
                    name_of_source_file_str = sprintf('%s%04d \n',src.name_of_source_folder,(iact_each-1));
                else 
                    sprintf('hellok')
                    name_of_source_file_str = sprintf('%s%04d \n',src.name_of_source_folder,(s_num-1))
                end
                
                SOURCE_FILE_standard3D;
                if src.flag_source_shape == 153
                    fclose(fileID);
                end 
            end
%              SOURCE_FILE_standard;
        end  % for iact_col = 1:src.transducer_number2 % each col        
    end % for iact_row = 1:src.transducer_number      % each row 
    
    if src.flag_source_shape == 154
        fclose(fileID);
    end 
% % % elseif  src.flag_source_shape == 153
% % %     
% % %     
% % % end


end

% % % for i_num = 1:length(src.matrix_s_num);
% % % % % 
% % % s_num = src.matrix_s_num(i_num);    
% % % 
% % % if src.flag_source_shape == 154
% % % source_filename = sprintf('FORCESOLUTION_%06d',s_num-1);
% % % parafullpath=strcat(src.folder_for_para,source_filename)
% % % fileID = fopen(parafullpath,'w');
% % % end
% % % 
% % % % name_of_source_file_str = sprintf(src.name_of_source_folder,' /n')
% % % % name_of_source_file_str = sprintf('%s \n',src.name_of_source_folder);
% % % 
% % % if src.flag_src_diff_stfs ~= 1
% % % name_of_source_file_str = sprintf('%s \n',src.name_of_source_file);
% % % elseif or(src.flag_source_shape == 3,src.flag_source_shape == 4) 
% % % name_of_source_file_str = sprintf('%s%04d \n',src.name_of_source_folder,(i_num-1));
% % % elseif or(src.flag_source_shape == 2,src.flag_source_shape == 5)
% % % name_of_source_file_str = sprintf('%s%04d \n',src.name_of_source_folder,(iact_each-1));
% % % else 
% % % name_of_source_file_str = sprintf('%s%04d \n',src.name_of_source_folder,(iact_each-1));
% % % end
% % % 
% % % SOURCE_FILE_standard3D;
% % % 
% % % 
% % % if src.flag_source_shape == 154
% % % fclose(fileID);
% % % end
% % % 
% % % end  % i_num = 1:length(src.matrix_s_num)
% % % 
% % % if src.flag_source_shape == 153
% % % fclose(fileID);
% % % end
% % % 
% % % end


