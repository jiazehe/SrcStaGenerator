

function [Rec] = create_STATIONS(src)

%% generate the arrays necessary to create the values in STATIONS file for specfem2d 
% src naming was a bit confusing: should be stations. 

% src=stations
switch src.flag_station_shape
   
    
    case 2
    % for full_circle
    for i = 1:round(src.NRec)
        Rec.RecPos(i,1) = src.x_center + src.r*sin(src.delta_degree*i); 
        Rec.RecPos(i,2) = src.y_center -src.r + src.r*(1-cos(src.delta_degree*i));
        Rec.RecAngles(i,1) = src.delta_degree*i;
        Rec.RecAngles_degree(i,1) = pi*src.delta_degree*i;
    end
    case 3
    % for one half_circle
    for i = 1:round(src.NRec/2)
        Rec.RecPos(i,1) = src.x_center + src.r*sin(src.delta_degree*i); 
        Rec.RecPos(i,2) = src.y_center -src.r + src.r*(1-cos(src.delta_degree*i));
        Rec.RecAngles(i,1) = src.delta_degree*i;
        Rec.RecAngles_degree(i,1) = pi*src.delta_degree*i;
    end

    
    
    case 11
    Rec.RecPos = src.RecPos;

    case 31
    for i = 1:round(src.NRec)
        % horizontal line, rec_center
        Bottom_x(i,1)=src.x_center- 0.5*src.transducer_length ...
            + src.delta_length*(i-1);
        Bottom_y(i,1)=src.y_center;    

        Rec.RecPos(i,1)=Bottom_x(i,1);
        Rec.RecPos(i,2)=Bottom_y(i,1);
    end
    case 53
         for iact_row = 1:src.transducer_number      % each row 
            for iact_col = 1:src.transducer_number2 % each col
                s_num = (iact_col + (iact_row-1) * src.transducer_number2 );   
                 tempx=src.x_center - 0.5*src.transducer_length2 ...
                 + src.delta_length * (iact_col - 1);
                 tempy=src.y_center + 0.5*src.transducer_length ...
                 - src.delta_length2 * (iact_row - 1); 
                 Rec.RecPos(s_num,1)=tempx;
                 Rec.RecPos(s_num,2)=tempy;
%              SOURCE_FILE_standard;
            end  % for iact_col = 1:src.transducer_number2 % each col        
        end % for iact_row = 1:src.transducer_number      % each row 
    
    case 61
    for i = 1:round(src.transducer_number-1)
        % horizontal line, rec_center  
        tempx=src.x_center- 0.5*src.transducer_length ...
            + src.delta_length*(i-1);
        tempy=src.y_center + 0.5*src.transducer_length2; 
        Rec.RecPos(i,1)=tempx;
        Rec.RecPos(i,2)=tempy;
    end
    for i = src.transducer_number:round(src.transducer_number + src.transducer_number2 - 2)
        % horizontal line, rec_center  
        tempx=src.x_center + 0.5*src.transducer_length
        tempy=src.y_center + 0.5*src.transducer_length2...
            - src.delta_length2*(i-round(src.transducer_number-1)-1);
        Rec.RecPos(i,1)=tempx;
        Rec.RecPos(i,2)=tempy;
    end
    for i = round(src.transducer_number + src.transducer_number2 - 1):round(src.transducer_number *2 + src.transducer_number2 - 3)
        tempx=src.x_center + 0.5*src.transducer_length ...
            - src.delta_length*(i - round(src.transducer_number + src.transducer_number2 - 2)-1);
        tempy=src.y_center - 0.5*src.transducer_length2; 
        Rec.RecPos(i,1)=tempx;
        Rec.RecPos(i,2)=tempy;
    end        
    for i = round(src.transducer_number*2 + src.transducer_number2 - 2):round(src.transducer_number *2 + src.transducer_number2* 2 - 4)
        tempx=src.x_center - 0.5*src.transducer_length;
        tempy=src.y_center - 0.5*src.transducer_length2...
            + src.delta_length2*(i -round(src.transducer_number *2 + src.transducer_number2 - 3)-1);
        Rec.RecPos(i,1)=tempx;
        Rec.RecPos(i,2)=tempy;
    end       
       % 2D array
       
    
    case 80
    syms x      %Defines variable for use in x and y coord calculation
    Array_Length_half = 31*.001;    %Half length of dist. between first and last sensor
    source_number = 0;

    Array_Points_Local = zeros([32 2]);
    Array_Points_Global = zeros([32 2]);
    Array_Points = [];
    theta = 0;
    theta_array = 0; 
    
    while theta<360
     
    source_number = source_number + 1;  %Defines which source number is being produced    
    s_num = source_number;
        
    array_start = (src.theta_start) - (src.angle_away); %Creates starting location of station based on location of source

    Difference = 360 -((src.theta_start + src.angle_away)-(src.theta_start - src.angle_away));  %Total distance needed to travel by stations
    
    %created parameter for save file location
    source_filename = sprintf('STATIONS_%06d',s_num-1);
    parafullpath=strcat(src.folder_for_para,source_filename);
    formatSpec = 'S%06d AA %20.19f %20.19f %2.1f %2.1f\n';
    m = src.Array_Total*32;
    sen_col = 0:(src.Array_Total*32)-1;
        
    while theta_array >= -Difference
    
    %Calculates the center of the source/array as well as the vector the
    %defines the surface of the array
    array_center = [src.r*cosd(array_start+theta+theta_array), src.r*sind(array_start+theta+theta_array)];

    Radius_Slope = (array_center(2)-src.y_center)/(array_center(1)-src.x_center);

    Array_Slope = -1/Radius_Slope;
    
    %Functions for calculating coordinates for each point (x and y)
    x_cord = @(x) array_center(1) + ((x)/sqrt(1+(Array_Slope)^2));
    y_cord = @(x) array_center(2) + ((x*Array_Slope)/(sqrt(1+(Array_Slope)^2)));
    
    theta_wrapped = wrapTo360(array_start+theta_array+theta); %Converts current theta location of the array to 0-360
    
    switch theta_wrapped   %Calculates the position of all station points
        case {90 270}   %Special case for 90deg and 270deg
             for n =1:32    

                Array_Points_Local(n,1) = -Array_Length_half+src.d*(n-1);
                Array_Points_Local(n,2) = src.r*sind(theta_wrapped);

                Array_Points_Global(n,1) = Array_Points_Local(n,1) - src.x_center;
                Array_Points_Global(n,2) = Array_Points_Local(n,2) - src.y_center;

             end
        case {0 180 360}    %Special case for 0deg 180deg and 360deg
            for n = 1:32

                Array_Points_Local(n,1) = src.r*cosd(theta_wrapped);
                Array_Points_Local(n,2) = Array_Length_half-src.d*(n-1);

                Array_Points_Global(n,1) = Array_Points_Local(n,1) - src.x_center;
                Array_Points_Global(n,2) = Array_Points_Local(n,2) - src.y_center;

            end
        otherwise
            for n = 1:32           %All other cases

                k = Array_Length_half-(src.d*(n-1));
                
                Array_Points_Local(n,1) = x_cord(k);
                Array_Points_Local(n,2) = y_cord(k);

                Array_Points_Global(n,1) = Array_Points_Local(n,1) - src.x_center;
                Array_Points_Global(n,2) = Array_Points_Local(n,2) - src.y_center;

            end      
    end 
     
     %Resets parameters for next station
     Array_Points = [Array_Points;Array_Points_Global];
     theta_array = theta_array - (Difference/(src.Array_Total-1));
    end  
    
    %Sves all data into specified file and folder
    fileID = fopen(parafullpath,'w');
    fprintf(fileID,formatSpec,[sen_col',Array_Points,zeros(m,1),zeros(m,1)]');
    theta = theta + (360/src.matrix_s_num);
    theta_array=0;
    Array_Points = [];
    end
        
         
         
end % switch src.flag_station_shape

if src.flag_station_shape ~= 4 && src.flag_station_shape ~= 80
    m=length(Rec.RecPos(:,1));
    sen_col = 0:m-1;
end



for i_num = 1:length(src.matrix_s_num)
% % 

if src.flag_station_shape ~= 80
s_num = src.matrix_s_num(i_num);    

if src.flag_station_shape == 4 
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
formatSpec = 'S%06d AA %20.19f %20.19f %2.1f %2.1f\n';

fileID = fopen(parafullpath,'w');
fprintf(fileID,formatSpec,[sen_col',Rec.RecPos(:,:),zeros(m,1),zeros(m,1)]');
fclose(fileID);

else
    
Rec.Array_Points=Array_Points;

end  % i_num = 1:length(src.matrix_s_num)


end



