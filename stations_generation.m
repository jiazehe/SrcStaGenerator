%% generate the SOURCE and STATIONS file

% created the cell array related to locations of the sources 
%%%%%%%%%%% STATIONS creation %%%%%%%%%%%%%%%%%%%%%
% sources/events matrix creation 
stations.flag_station_shape = flag_station_shape;
stations.matrix_s_num = matrix_s_num;
stations.folder_for_para = folder_for_para;
switch flag_station_shape

    case {2,3,4} 
    stations.r = r;
    stations.x_center = rec_x_center;
    stations.y_center = rec_y_center;
    stations.NRec = NRec;
    stations.delta_degree = 2*pi/NRec;
    src.N = length(matrix_s_num);
    stations.src_deltat_degree= 2*pi/src.N
    
    case 31 
    % r is the length of the linear array 
    stations.transducer_length = receiver_length;
%     stations.transducer_length2 = receiver_length2;
    stations.x_center = rec_x_center;
    stations.y_center = rec_y_center+receiver_length2/2;
    stations.NRec = receiver_number;
    stations.delta_length = rdeltaL;
    %stations.delta_degree = 2*pi/NRec;
    
    case {53,61} % 4 linear arrays for reception 
    % r is the length of the linear array 
    stations.x_center = rec_x_center;
    stations.y_center = rec_y_center;
    stations.NRec = receiver_number * 2 + receiver_number2 * 2 - 4;
    stations.transducer_number = receiver_number;
    stations.transducer_number2 = receiver_number2;
    stations.transducer_length = receiver_length;
    stations.transducer_length2 = receiver_length2;
    stations.delta_length = rdeltaL;
    stations.delta_length2 = rdeltaL2;
    
    case 11
%     stations.RecPos =mystation.RecPos;    
    stations.RecPos =mystation.RecPos(1:176,:);
    
    case {80}
    %Ryan_Moreno Test Source Generation
    stations.x_center = source_center_x;
    stations.y_center = source_center_y;
    stations.r = r;
    stations.d = d;
    stations.matrix_s_num = matrix_s_num;
    stations.Array_Total = Array_Total;
    stations.angle_away = angle_away;
    stations.theta_start = theta_start;
    stations.Operating_Source_Points = Operating_Source_Points;
    
    
end
    
% end
Rectemp = create_STATIONS(stations);
%%%%%%%%%%% STATIONS creation %%%%%%%%%%%%%%%%%%%%%

