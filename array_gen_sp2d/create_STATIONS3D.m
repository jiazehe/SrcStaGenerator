

function [Rec] = create_STATIONS3D(src)

%% generate the arrays necessary to create the values in STATIONS file for specfem2d 
% src naming was a bit confusing: should be stations. 
% src=stations
switch src.flag_shape
    case 153
         for iact_x = 1:src.transducer_number      % each row 
            for iact_y = 1:src.transducer_number2 % each col
                for iact_z = 1:src.transducer_number3 % each col
                s_num = (iact_z + (iact_y-1) * src.transducer_number3 ...
                    +(iact_x-1)*(src.transducer_number2*src.transducer_number3) );   
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

if src.flag_shape ~= 154
    m=length(Rec.RecPos(:,1));
    sen_col = 0:m-1;
end

for i_num = 1:length(src.matrix_s_num)
% % 
s_num = src.matrix_s_num(i_num);    

if src.flag_shape == 154
    % for the other half_circle
    for i = 1:round(src.NRec/2)
        Rec.RecPos(i,1) = src.x_center - src.r*sin(src.delta_degree*i+src.src_deltat_degree*(i_num-1)); 
        Rec.RecPos(i,2) = src.y_center + src.r - src.r*(1-cos(src.delta_degree*i+src.src_deltat_degree*(i_num-1)));
        Rec.RecAngles(i,1) = src.delta_degree*i+src.src_deltat_degree*(i_num-1);
        Rec.RecAngles_degree(i,1) = pi*(src.delta_degree*i+src.src_deltat_degree*(i_num-1));
    end    
m=length(Rec.RecPos(:,1));
sen_col = 0:m-1;
end

source_filename = sprintf('STATIONS_%06d',s_num-1);
parafullpath=strcat(src.folder_for_para,source_filename)
formatSpec = '%d AA %10.9f %10.9f %2.1f %10.9f\n';

fileID = fopen(parafullpath,'w');
fprintf(fileID,formatSpec,[sen_col',Rec.RecPos(:,1:2),zeros(m,1),Rec.RecPos(:,3)]');
fclose(fileID);

end  % i_num = 1:length(src.matrix_s_num)




