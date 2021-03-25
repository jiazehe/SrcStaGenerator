% load the pa 

% created on Wed Oct 24 20:28:18 UTC 2018
% created by Jiaze He 

flag_define_para = 1 
flag_assign_value = 2 % 1:using passed-in values from para; 2: define-directly 
flag_source_shape = 5 % 1 point 2 line 3 point-on-a-line
% 4 point-on-a-circle % 5 multiple sources on a circle 21 circle
flag_src_diff_stfs=1; % 1 for different stfs; 0 - same stf
flag_station_shape = 2 % 1 line 2 circle 3 halfcircle 11 predefined RecPos
% 31 horizontal line, given rec_center 




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
    f0=300000; 
    fmax=1000000;
    dt = 4.882812500000000e-08;
    NRec = 360; % for half circle - actual receivers are counted in create_STATIONS

    %%%%%%%%%%%%%% parameters related to media and transducers %%%%%%%
    tank_half = 0.02;
    transducer_number = 12; % need to be changed to 1 if point source 
    transducer_length=0.004;
    deltaL = transducer_length/(transducer_number-1);% not useful
    source_center_x = - 0.00001; % not useful
    source_center_y = - 0.00001; % not useful
    source_type = 1; 
    time_function_type = 8;
    %%%%%%%%%%%%%%%%%%%%%%% parameters related to receivers %%%%%%%%%%
    r = 0.03;
    rec_x_center = 0;
    rec_y_center = 0;    
    r_src = 0.003
end

% matrix_s_num = [1];
matrix_s_num = 1;

% medium dimensions







    


