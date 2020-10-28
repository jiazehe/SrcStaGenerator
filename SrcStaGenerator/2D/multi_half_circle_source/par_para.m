% load the pa 

% created on Wed Oct 24 20:28:18 UTC 2018
% created by Jiaze He 

% revised on 
% add flag_station_shape = 4 the other half circle


flag_define_para = 1 
flag_assign_value = 2 % 1:using passed-in values from para; 2: define-directly 
flag_source_shape = 21 % 1 point 2 line 21 circle
flag_station_shape = 4 % 1 line 2 circle 3 halfcircle 4 the other half


if flag_define_para == 1 
% set the basic constants (if not loading from somewhere)
    para.f0=100000; 
    para.fmax = 1000000;
    para.dt = 1e-8;
    para.NRec = 450;
end 

matrix_s_num = 1:120;
% matrix_s_num = [1,2,3,4];
%matrix_s_num = [1,2,3,4,5,6,7,8];

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
    dt = 4e-8;
    NRec = 360; % for half circle - actual receivers are counted in create_STATIONS

    %%%%%%%%%%%%%% parameters related to media and transducers %%%%%%%
    tank_half = 0.034;
    transducer_number = 1; % need to be changed to 1 if point source 
    transducer_length=0.004;
    deltaL = transducer_length/(length(matrix_s_num)-1);% not useful
    source_center_x = 0; % not useful - 0.00001;
    source_center_y = 0; % not useful
    source_type = 1; 
    time_function_type = 1;
    %%%%%%%%%%%%%%%%%%%%%%% parameters related to receivers %%%%%%%%%%
    r = 0.017; % r = 0.095;
    rec_x_center = 0;
    rec_y_center = 0;
    
end



% medium dimensions







    


