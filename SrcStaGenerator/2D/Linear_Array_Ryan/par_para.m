% load the par_para

% created on Sat Jun 27 11:40am
% created by Ryan M

flag_define_para = 1; %Defines set-up for the parameters
flag_assign_value = 1; %Defines whether or not Sources use full 32 points or a custom set of points
flag_source_shape = 80; %Defines set-up for the source in Source_Generation
flag_station_shape = 80; %Defines set-up for the station in station_Generation
%flag_station_shape = N/A

if flag_define_para ==1
   %Basic Constants 
    para.f0 = 300000;
   para.Custom_Source_Points = [1 32]; %Custom set of source points to be operated
end

if flag_assign_value == 1 
    %Sets Operated sources points to the total 32 points
    Operating_Source_Points = (1:32);
    f0 = para.f0;
elseif flag_assign_value == 2
    %Sets Operated source points to a custom set as set by the user
    Custom_Source_Points = para.Custom_Source_Points;
    Operating_Source_Points = Custom_Source_Points;   
    f0 = para.f0;
end

source_center_x = 0.0; %X point for Center of Experiment
source_center_y = 0.0; %y point for Center of Experiment
anglesource = 0.00; %Useless for this experiment (can be set to 0)
source_type = 1; %Useless for this experiment (set to 1)
flag_src_diff_stfs = 0; %Useless for this experiment (set to 0)
time_function_type = 1; %Useless for this experiment (set to 0)
transducer_number = 1; %Useless for this experiment (set to 1)

r = 0.02; %Radius the arrays will move around experiment's object (m)
d = .002; %Distance between each point on array (m)

matrix_s_num = 4; %Total Source locations in experiment
Array_Total = 3; %Total stations for each Source location

angle_away = 90; %Angle between source and first Array
theta_start = 180; %Starting position of first Source Location

name_of_source_folder = strcat(sysHOME, '/csp2d_base/DATA/sources/5pks_conamp_nod_3srcs_100k/')
name_of_source_file = strcat(sysHOME, '/csp2d_base/DATA/sources/5pks_conamp_nod_3srcs_100k/0001')

