% load the pa 

% created on Wed Oct 24 20:28:18 UTC 2018
% created by Jiaze He 



flag_define_para = 1 
flag_assign_value = 2 % 1:using passed-in values from para; 2: define-directly 
flag_source_shape = 154 % 1 point 2 line 3 point-on-a-line 21 circle 31 circle
%153 3D volume %154 3D volume points
flag_src_diff_stfs=1; % 1 for different stfs; 0 - same stf
flag_station_shape = 153 % 1 line 2 circle 3 halfcircle 11 predefined RecPos
% 31 horizontal line, given rec_center 
% 153 3D volume


matrix_s_num = 1


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
    f0=100000; 
    fmax=1000000;
    dt = 4.882812500000000e-08;
    NRec = 360; % for half circle - actual receivers are counted in create_STATIONS

    %%%%%%%%%%%%%% parameters related to media and transducers %%%%%%%
    tank_half = 0.02;
    src_x_center = -0.02; %  0.015;
    src_y_center = 0.01;
    src_z_center = 0.021;

    transducer_number = 1   %  transducer_number in one row, (num of col) 
    transducer_number2 = 1; %  transducer_number in one col, (num of row) 
    transducer_number3 = 20; %  transducer_number in one col, (num of row) 

    transducer_length=0.02;  % transducer length in one row, 
    transducer_length2=0.02;  % transducer length in one col,  
    transducer_length3=0.01;  % transducer length in one col,  

    if transducer_number==1
    sdeltaL = 0.5*transducer_length;
    src_x_center = src_x_center + 0.5*transducer_length; %  0.015;
    else
    sdeltaL = transducer_length/(transducer_number-1);% not useful
    end

    if transducer_number2==1
    sdeltaL2 = 0.5*transducer_length2;
    src_x_center = src_x_center + 0.5*transducer_length2; %  0.015;
    else
    sdeltaL2 = transducer_length2/(transducer_number2-1);% not useful
    end

    if transducer_number3==1
    sdeltaL3 = 0.5*transducer_length3;
    src_x_center = src_x_center + 0.5*transducer_length3; %  0.015;
    else
    sdeltaL3 = transducer_length3/(transducer_number3-1);% not useful
    end

    %%%%%%%%%%%%%%%%%%%%%%% parameters related to receivers %%%%%%%%%%
    r = 0.03;
    rec_x_center = 0.00; %  0.015;
    rec_y_center = 0.000;
    rec_z_center = 0.021;
    receiver_number = 1; %  transducer_number in one row
    receiver_number2 = 21; 
    receiver_number3 = 21; 
    receiver_length=0.02;
    receiver_length2=0.01;
    receiver_length3=0.01;
    
    if receiver_number==1
    rdeltaL = 0.5*receiver_length;
    rec_x_center = rec_x_center + 0.5*receiver_length; %  0.015;
    else
    rdeltaL = receiver_length/(receiver_number-1);% not useful
    end
    
    if receiver_number2==1
    rdeltaL2 = 0.5*receiver_length2;
    rec_y_center = rec_y_center + 0.5*receiver_length2; %  0.015;
    else
    rdeltaL2 = receiver_length2/(receiver_number2-1);% not useful
    end    
    
    if receiver_number3==1
    rdeltaL3 = 0.5*receiver_length3;
    rec_z_center = rec_z_center + 0.5*receiver_length3; %  0.015;
    else
    rdeltaL3 = receiver_length3/(receiver_number3-1);% not useful
    end        

%     name_of_source_folder = "/home/jiazeh/csp2d_base/DATA/sources/Lin3_5pks_iobs_7srcs/";
%     name_of_source_file = '/home/jiazeh/csp2d_base/DATA/sources/ricker_3src/line/0001';
%     
    name_of_source_folder = strcat(sysHOME, '/csp2d_base/DATA/sources3d/3D_5pks_simamp_nod_21srcs_100k_wdelay/')
    name_of_source_file = strcat(sysHOME, '/csp2d_base/DATA/sources3d/3D_5pks_simamp_nod_21srcs_100k_wdelay/0001')
end







    


