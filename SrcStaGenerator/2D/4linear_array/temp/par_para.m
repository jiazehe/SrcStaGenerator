% load the pa 

% created on Wed Oct 24 20:28:18 UTC 2018
% created by Jiaze He 



flag_define_para = 1 
flag_assign_value = 2 % 1:using passed-in values from para; 2: define-directly 
flag_source_shape = 74 % 1 point 2 line 3 point-on-a-line 21 circle 31 circle
% each point on a rectangular 53
flag_src_diff_stfs=1; % 1 for different stfs; 0 - same stf
flag_station_shape = 61 % 1 line 2 circle 3 halfcircle 11 predefined RecPos
% 31 horizontal line, given rec_center  %53 Rec wavefield

matrix_s_num = 4;


if flag_define_para == 1 
% set the basic constants (if not loading from somewhere)
    para.f0=500000; 
    para.fmax = 1000000;
    para.dt = 1e-8;
    para.NRec = 450;
end 


if flag_assign_value == 1 
    f0=para.f0; 
    fmax=para.fmax;
    dt = para.dt;
    NRec = para.NRec;
elseif flag_assign_value == 2 
    % define values here
    
    %%%%%% assign the values related to the source time function (stf)
    f0=1000000; 
    fmax=1000000;
    dt = 2e-08;
%     dt = 4.882812500000000e-08;
    NRec = 360; % for half circle - actual receivers are counted in create_STATIONS

    %%%%%%%%%%%%%% parameters related to media and transducers %%%%%%%
    tank_half = 0.02;
    transducer_number = 32;   %  transducer_number in one row, (num of col) 
    transducer_number2 = 32; %  transducer_number in one col, (num of row) 
    transducer_length=0.0112;  % transducer length in one row, 
    transducer_length2=0.0112;  % transducer length in one col,  
    if transducer_number==1
    deltaL = 0.5*transducer_length
    else
    deltaL = transducer_length/(transducer_number-1);% not useful
    end
    deltaL2 = transducer_length2/(transducer_number2-1);
    source_center_x = 0; % not useful 0.00199
    source_center_y = 0; % not useful
    anglesource = 0.00;
    source_type = 1; 
    time_function_type = 1;
    %%%%%%%%%%%%%%%%%%%%%%% parameters related to receivers %%%%%%%%%%
    r = 0.03;
    rec_x_center = 0.0;
    rec_y_center = 0.0;
    receiver_number = 32; %  transducer_number in one row
    receiver_number2 = 32; 
    receiver_length=0.0112;
    receiver_length2=0.0112;
    rdeltaL = receiver_length/(receiver_number-1);% not useful
    rdeltaL2 = receiver_length2/(receiver_number2-1);
    
    
%     name_of_source_folder = "/home/jiazeh/csp2d_base/DATA/sources/Lin3_5pks_iobs_7srcs/";
%     name_of_source_file = '/home/jiazeh/csp2d_base/DATA/sources/ricker_3src/line/0001';
    name_of_source_folder = strcat(sysHOME, '/csp2d_base/DATA/sources/5pks_conamp_nod_3srcs_100k/')
    name_of_source_file = strcat(sysHOME, '/csp2d_base/DATA/sources/5pks_conamp_nod_3srcs_100k/0001')
    
end

% matrix_s_num = 1:4;
% matrix_s_num = [1]


% medium dimensions







    


