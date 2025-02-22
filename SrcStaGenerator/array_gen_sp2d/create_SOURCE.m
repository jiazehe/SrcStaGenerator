

function [SRC] = create_SOURCE(src)

%% generate the arrays necessary to create the values in SOURCE file for specfem2d 
for i_num = 1:length(src.matrix_s_num)

s_num = src.matrix_s_num(i_num);    
source_filename = sprintf('SOURCE_%06d',s_num-1);
parafullpath=strcat(src.folder_for_para,source_filename)
fileID = fopen(parafullpath,'w');

%source_center_x =  0.00001;

% % % 
% % % SIN=sin(SrcAngles(s_num)/180*pi);
% % % COS=cos(SrcAngles(s_num)/180*pi);


% SOURCE_file0.write("FORCE  0\n")
% SOURCE_file0.write("time shift:     0.0000")
% SOURCE_file0.write("f0 = %f\n" % f0)
% SOURCE_file0.write("latorUTM: = 0.3\n")
% SOURCE_file0.write("longorUTM: = 0.2\n")
% SOURCE_file0.write("depth: = 0.0\n")
% SOURCE_file0.write("factor force source:             1.d0\n")
% SOURCE_file0.write("component dir vect source E:     0.d0\n")
% SOURCE_file0.write("component dir vect source N:     0.d0\n")
% SOURCE_file0.write("component dir vect source Z_UP:  0.d0\n")




for iact_each = 1:src.transducer_number

    
switch src.flag_source_shape   
    case 2
Bottom_x(iact_each,1)=src.source_center_x;
Bottom_y(iact_each,1)=src.source_center_y - 0.5*src.transducer_length ...
    + src.delta_length*iact_each;    

tempx=Bottom_x(iact_each,1);
tempy=Bottom_y(iact_each,1);
    case 1
tempx=src.source_center_x;
tempy=src.source_center_y; 

    case 3
tempx=src.source_center_x- 0.5*src.transducer_length ...
    + src.delta_length*(i_num-1);
tempy=src.source_center_y;    
 
    case 4 
tempx= src.x_center + src.r_src*cos(src.delta_degree*(i_num-1)); 
tempy= src.y_center + src.r_src*sin(src.delta_degree*(i_num-1)); 

    case 5 
tempx= src.x_center + src.r_src*cos(src.delta_degree*(iact_each-1)); 
tempy= src.y_center + src.r_src*sin(src.delta_degree*(iact_each-1)); 

    case 21
        i = i_num;
        tempx= src.x_center + src.r*cos(src.delta_degree*(i-1)); 
        tempy= src.y_center + src.r*sin(src.delta_degree*(i-1));
        
    case 31
        Bottom_x(iact_each,1)=src.source_center_x - 0.5*src.transducer_length ...
        + src.delta_length*(iact_each-1); 
        Bottom_y(iact_each,1)=src.source_center_y - 0.5*src.transducer_length; 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);
    case 32
        Bottom_x(iact_each,1)=src.source_center_x + 0.5*src.transducer_length; 
        Bottom_y(iact_each,1)=src.source_center_y - 0.5*src.transducer_length ...
        + src.delta_length*(iact_each-1); 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);
    case 33
        Bottom_x(iact_each,1)=src.source_center_x + 0.5*src.transducer_length ...
        - src.delta_length*(iact_each-1); 
        Bottom_y(iact_each,1)=src.source_center_y + 0.5*src.transducer_length; 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);
    case 34
        Bottom_x(iact_each,1)=src.source_center_x - 0.5*src.transducer_length; 
        Bottom_y(iact_each,1)=src.source_center_y + 0.5*src.transducer_length ...
        - src.delta_length*(iact_each-1); 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);

    case 36
        Bottom_x(iact_each,1)=src.source_center_x - 0.5*src.transducer_length ...
        + src.delta_length*(iact_each-1); 
        Bottom_y(iact_each,1)=src.source_center_y + 0.5*src.transducer_length2; 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);
        
    case 71
        i = iact_each;
        tempx=src.x_center- 0.5*src.transducer_length ...
            + src.delta_length*(i-1);
        tempy=src.y_center + 0.5*src.transducer_length2; 
%         Rec.RecPos(i,1)=tempx;
%         Rec.RecPos(i,2)=tempy;
    case 72
        i = iact_each; 
        tempx=src.x_center + 0.5*src.transducer_length
        tempy=src.y_center + 0.5*src.transducer_length2...
            - src.delta_length2*(i-1);
%         Rec.RecPos(i,1)=tempx;
%         Rec.RecPos(i,2)=tempy;
    case 73
        i = iact_each; 
        tempx=src.x_center + 0.5*src.transducer_length ...
            - src.delta_length*(i-1);
        tempy=src.y_center - 0.5*src.transducer_length2; 
%         Rec.RecPos(i,1)=tempx;
%         Rec.RecPos(i,2)=tempy;
    case 74
        i = iact_each; 
        tempx=src.x_center - 0.5*src.transducer_length;
        tempy=src.y_center - 0.5*src.transducer_length2...
            + src.delta_length2*(i-1);
%         Rec.RecPos(i,1)=tempx;
%         Rec.RecPos(i,2)=tempy;
         
end % switch src.flag_source_shape 



% if or(src.flag_source_shape == 53,src.flag_source_shape == 54,src.flag_source_shape == 75) 
if ismembertol(src.flag_source_shape, [53, 54, 75, 80])    
else
fprintf(fileID,'source_surf = .false. \n');
% source_point_x=transducer_length/transducer_number*iact_each;
xs_str = sprintf('xs = %6.5f \n', tempx);
fprintf(fileID,xs_str);
zs_str = sprintf('zs = %6.5f \n',tempy);
fprintf(fileID,zs_str);
fprintf(fileID,'source_type = %d \n', src.source_type);
fprintf(fileID,'time_function_type = %d \n',src.time_function_type);
if src.flag_src_diff_stfs ~= 1
name_of_source_file_str = sprintf('name_of_source_file          =  %s \n',src.name_of_source_file);
elseif or(src.flag_source_shape == 3,src.flag_source_shape == 4) 
name_of_source_file_str = sprintf('name_of_source_file          =  %s%04d \n',src.name_of_source_folder,(i_num-1));
elseif or(src.flag_source_shape == 2,src.flag_source_shape == 5)
name_of_source_file_str = sprintf('name_of_source_file          =  %s%04d \n',src.name_of_source_folder,(iact_each-1));
else 
name_of_source_file_str = sprintf('name_of_source_file          =  %s%04d \n',src.name_of_source_folder,(iact_each-1));
end
fprintf(fileID,name_of_source_file_str);
fprintf(fileID,'burst_band_width = 200.415 \n');
fprintf(fileID,'f0 = %6.3f \n',src.f0);
fprintf(fileID,'tshift = 0 \n');
fprintf(fileID,'anglesource = %2.2f \n',src.anglesource);
fprintf(fileID,'Mxx = 1.000000 \n');
fprintf(fileID,'Mzz = 1.000000 \n');
fprintf(fileID,'Mxz = 0.000000 \n');
fprintf(fileID,'factor = 1000.000 \n');
end  % if or(src.flag_source_shape == 53,src.flag_source_shape == 54)

end % for iact_each = 1:src.transducer_number
fclose(fileID);
end  % for i_num = 1:length(src.matrix_s_num)



if or(src.flag_source_shape == 53,src.flag_source_shape == 54)
    
    if src.flag_source_shape == 54
       % open source file name for many point sources for one file 
         source_filename = sprintf('SOURCE_%06d',0);
         parafullpath=strcat(src.folder_for_para,source_filename)
         fileID = fopen(parafullpath,'w');
    end
    
    for iact_row = 1:src.transducer_number      % looping in a row
        for iact_col = 1:src.transducer_number2 % looping in a col
            %numbering of the total sources
            s_num = (iact_col + (iact_row-1) * src.transducer_number2 );   
            if src.flag_source_shape == 53
            % open source file name for each point source for itt     
               source_filename = sprintf('SOURCE_%06d',s_num-1);
               parafullpath=strcat(src.folder_for_para,source_filename)
               fileID = fopen(parafullpath,'w');
            end
            tempx=src.source_center_x - 0.5*src.transducer_length ...
                + src.delta_length * (iact_row - 1);
            tempy=src.source_center_y + 0.5*src.transducer_length2 ...
                - src.delta_length2 * (iact_col - 1); 
            SRC.SrcPos(s_num,1) = tempx;
            SRC.SrcPos(s_num,2) = tempy;
            SOURCE_FILE_standard;           
            if src.flag_source_shape == 53
               fclose(fileID);
            end
        end  % for iact_col = 1:src.transducer_number2 % each col        
    end % for iact_row = 1:src.transducer_number      % each row 
     
    if src.flag_source_shape == 54
        fclose(fileID);
    end
end


if src.flag_source_shape == 75
%        for iact_row = 1:src.transducer_number      % each row 
%             for iact_col = 1:src.transducer_number2 % each col
    for i = 1:round(src.transducer_number-1)
        % horizontal line, rec_center  
        tempx=src.x_center- 0.5*src.transducer_length ...
            + src.delta_length*(i-1);
        tempy=src.y_center + 0.5*src.transducer_length2; 
        s_num = i; % (iact_col + (iact_row-1) * src.transducer_number2 );   
        source_filename = sprintf('SOURCE_%06d',s_num-1);
        parafullpath=strcat(src.folder_for_para,source_filename)
        fileID = fopen(parafullpath,'w');                    
        SOURCE_FILE_standard;
        fclose(fileID);
    end
    for i = src.transducer_number:round(src.transducer_number + src.transducer_number2 - 2)
        % horizontal line, rec_center  
        tempx=src.x_center + 0.5*src.transducer_length
        tempy=src.y_center + 0.5*src.transducer_length2...
            - src.delta_length2*(i-round(src.transducer_number-1)-1);
        s_num = i; % (iact_col + (iact_row-1) * src.transducer_number2 );   
        source_filename = sprintf('SOURCE_%06d',s_num-1);
        parafullpath=strcat(src.folder_for_para,source_filename)
        fileID = fopen(parafullpath,'w');                    
        SOURCE_FILE_standard;
        fclose(fileID);
    end
    for i = round(src.transducer_number + src.transducer_number2 - 1):round(src.transducer_number *2 + src.transducer_number2 - 3)
        tempx=src.x_center + 0.5*src.transducer_length ...
            - src.delta_length*(i - round(src.transducer_number + src.transducer_number2 - 2)-1);
        tempy=src.y_center - 0.5*src.transducer_length2; 
        s_num = i; % (iact_col + (iact_row-1) * src.transducer_number2 );   
        source_filename = sprintf('SOURCE_%06d',s_num-1);
        parafullpath=strcat(src.folder_for_para,source_filename)
        fileID = fopen(parafullpath,'w');                    
        SOURCE_FILE_standard;
        fclose(fileID);
    end        
    for i = round(src.transducer_number*2 + src.transducer_number2 - 2):round(src.transducer_number *2 + src.transducer_number2* 2 - 4)
        tempx=src.x_center - 0.5*src.transducer_length;
        tempy=src.y_center - 0.5*src.transducer_length2...
            + src.delta_length2*(i -round(src.transducer_number *2 + src.transducer_number2 - 3)-1);
        s_num = i; % (iact_col + (iact_row-1) * src.transducer_number2 );   
        source_filename = sprintf('SOURCE_%06d',s_num-1);
        parafullpath=strcat(src.folder_for_para,source_filename)
        fileID = fopen(parafullpath,'w');                    
        SOURCE_FILE_standard;
        fclose(fileID);
    end         
end
if src.flag_source_shape == 80
    
syms x %defines variable for x and y coord position
Array_Length_half = 31*.001; %Half length of dist. between first and last sensor
source_number = 0;
theta = 0;

while theta<360
    
source_number = source_number + 1;  %Defines which source number is being produced    

%Calculates the center of the source/array as well as the vector the
%defines the surface of the array
source_center = [src.r*cosd(src.theta_start+theta), src.r*sind(src.theta_start+theta)];

Radius_Slope = (source_center(2)-src.y_center)/(source_center(1)-src.x_center);

Array_Slope = -1/Radius_Slope;

x_cord = @(x) source_center(1) + ((x)/sqrt(1+(Array_Slope)^2));
y_cord = @(x) source_center(2) + ((x*Array_Slope)/(sqrt(1+(Array_Slope)^2)));

theta_wrapped = wrapTo360(src.theta_start+theta); %Converts current theta location of the array to 0-360

switch theta_wrapped    %Calculates the position of all source points
    case {90 270}
         for n = 1:length(src.Operating_Source_Points) %Special case for 90deg and 270deg
             
            Source_Location = src.Operating_Source_Points(n);
        
            Source_Points_Local(n,1) = -Array_Length_half+(Source_Location-1)*src.d;
            Source_Points_Local(n,2) = src.r*sind(theta_wrapped);

            Source_Points_Global(n,1) = Source_Points_Local(n,1) - src.x_center;
            Source_Points_Global(n,2) = Source_Points_Local(n,2) - src.y_center;
    
         end
    case {180 360} 
        for n = 1:length(src.Operating_Source_Points)   %Special case for 180deg and 360deg
            
            Source_Location = src.Operating_Source_Points(n);

            Source_Points_Local(n,1) = src.r*cosd(theta_wrapped);
            Source_Points_Local(n,2) = Array_Length_half-src.d*(Source_Location-1);

            Source_Points_Global(n,1) = Source_Points_Local(n,1) - src.x_center;
            Source_Points_Global(n,2) = Source_Points_Local(n,2) - src.y_center;
            
        end
    otherwise
        for n = 1:length(src.Operating_Source_Points)   %All other cases
            
            Source_Location = src.Operating_Source_Points(n);
            
            k = Array_Length_half-(src.d*(Source_Location-1));
    
            Source_Points_Local(n,1) = x_cord(k);
            Source_Points_Local(n,2) = y_cord(k);

%             Source_Points_Global(n,1) = Source_Points_Local(n,1) - source_center_x;
%             Source_Points_Global(n,2) = Source_Points_Local(n,2) - source_center_y;
           Source_Points_Global(n,1) = Source_Points_Local(n,1) - src.x_center;
            Source_Points_Global(n,2) = Source_Points_Local(n,2) - src.y_center;
        end
        
end
    
    %Saves all data as a file located in specified folder as defines in
    %par_para
    s_num = source_number; 
    source_filename = sprintf('SOURCE_%06d',s_num-1);
    parafullpath=strcat(src.folder_for_para,source_filename);
    fileID = fopen(parafullpath,'w'); 
    for i = 1:length(src.Operating_Source_Points)
    tempx = Source_Points_Global(i,1);
    tempy = Source_Points_Global(i,2);           
    SOURCE_FILE_standard;
    end

 
    theta = theta + (360/src.matrix_s_num); %Resets parameters for next source
end
    
end   
end


% fprintf(fileID,formatSpec,[sen_col',squeeze(RecPos(s_num,:,:)),zeros(m,1),zeros(m,1)]');




