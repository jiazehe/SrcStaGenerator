


stations.folder_for_para = folder_for_para;
stations.flag_shape = flag_station_shape;
stations.matrix_s_num = matrix_s_num;


switch stations.flag_shape
    case{153,154}
    % r is the length of the linear array 
    stations.x_center = rec_x_center;
    stations.y_center = rec_y_center;
    stations.z_center = rec_z_center;
    stations.transducer_number = receiver_number;
    stations.transducer_number2 = receiver_number2;
    stations.transducer_number3 = receiver_number3;
 
    stations.transducer_length = receiver_length;
    stations.transducer_length2 = receiver_length2;
    stations.transducer_length3 = receiver_length3;
    stations.delta_length = rdeltaL;
    stations.delta_length2 = rdeltaL2;
    stations.delta_length3 = rdeltaL3;
end

Rectemp = create_STATIONS3D(stations);

% % tempx = 0.06
% % tempy = 0.05
% % tempz = 0.025
% % 
% % Rec.RecPos(1,1)=tempx;
% % Rec.RecPos(1,2)=tempy;
% % Rec.RecPos(1,3)=tempz;
% % 
% % Rec.RecPos(2,1)=tempx;
% % Rec.RecPos(2,2)=tempy*2;
% % Rec.RecPos(2,3)=tempz;
% % 
% % m=length(Rec.RecPos(:,1));
% % 
% % for i_num = 1:length(matrix_s_num)
% % % % 
% % s_num = 1%matrix_s_num(i_num);    
% % 
% % sen_col = 0:m-1;
% % 
% % 
% % source_filename = sprintf('STATIONS_%06d',s_num-1);
% % parafullpath=strcat(stations.folder_for_para,source_filename)
% % formatSpec = 'S%06d AA %10.9f %10.9f %2.1f %10.9f\n';
% % 
% % fileID = fopen(parafullpath,'w');
% % fprintf(fileID,formatSpec,[sen_col',Rec.RecPos(:,1:2),zeros(m,1),Rec.RecPos(:,3)]');
% % fclose(fileID);

