function create_plot_source_stations_Ryan(src)

%THIS FUNCTION CREATES THE PLOTS AND PICTURES FOR THE LINEAR_ARRAY_RYAN
%PAR_PARA AND SHOULD NOT BE USED FOR OTHER PAR_PARAs AND EXPERIMENTS

%FOR ADDITONAL INFORMATION ABOUT THIS CODE PLEASE CHECK CREATE_STATIONS AND
%CREATE_SOURCES CASE 80 FOR HOW THIS CODE WORKS.

syms x
Array_Length_half = 31*.001;
source_number = 0;
theta = 0;
Array_Points_Local = zeros([32 2]);
Array_Points_Global = zeros([32 2]);
theta_array = 0; 

while theta<360
    
source_number = source_number + 1;    
    
source_center = [src.r*cosd(src.theta_start+theta), src.r*sind(src.theta_start+theta)];

Radius_Slope = (source_center(2)-src.y_center)/(source_center(1)-src.x_center);

Array_Slope = -1/Radius_Slope;

array_start = (src.theta_start) - (src.angle_away);

Difference = 360 -((src.theta_start + src.angle_away)-(src.theta_start - src.angle_away));

x_cord = @(x) source_center(1) + ((x)/sqrt(1+(Array_Slope)^2));
y_cord = @(x) source_center(2) + ((x*Array_Slope)/(sqrt(1+(Array_Slope)^2)));

theta_wrapped = wrapTo360(src.theta_start+theta);

figure
hold on
axis square
viscircles([src.source_center_x, src.source_center_y],src.r);

switch theta_wrapped
    case {90 270}
         for n = 1:length(src.Operating_Source_Points)
             
            Source_Location = src.Operating_Source_Points(n);
        
            Source_Points_Local(n,1) = -Array_Length_half+(Source_Location-1)*src.d;
            Source_Points_Local(n,2) = src.r*sind(theta_wrapped);

            Source_Points_Global(n,1) = Source_Points_Local(n,1) - src.x_center;
            Source_Points_Global(n,2) = Source_Points_Local(n,2) - src.y_center;
    
         end
    case {180 360} 
        for n = 1:length(src.Operating_Source_Points)
            
            Source_Location = src.Operating_Source_Points(n);

            Source_Points_Local(n,1) = src.r*cosd(theta_wrapped);
            Source_Points_Local(n,2) = Array_Length_half-src.d*(Source_Location-1);

            Source_Points_Global(n,1) = Source_Points_Local(n,1) - src.x_center;
            Source_Points_Global(n,2) = Source_Points_Local(n,2) - src.y_center;
            
        end
    otherwise
        for n = 1:length(src.Operating_Source_Points)
            
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

plot(Source_Points_Global(:,1),Source_Points_Global(:,2), 'gx')

while theta_array >= -Difference

    array_center = [src.r*cosd(array_start+theta+theta_array), src.r*sind(array_start+theta+theta_array)];

    Radius_Slope = (array_center(2)-src.y_center)/(array_center(1)-src.x_center);

    Array_Slope = -1/Radius_Slope;

    x_cord = @(x) array_center(1) + ((x)/sqrt(1+(Array_Slope)^2));
    y_cord = @(x) array_center(2) + ((x*Array_Slope)/(sqrt(1+(Array_Slope)^2)));
    
    theta_wrapped = wrapTo360(array_start+theta_array+theta);
    switch theta_wrapped   
        case {90 270}
             for n =1:32

                Array_Points_Local(n,1) = -Array_Length_half+src.d*(n-1);
                Array_Points_Local(n,2) = src.r*sind(theta_wrapped);

                Array_Points_Global(n,1) = Array_Points_Local(n,1) - src.x_center;
                Array_Points_Global(n,2) = Array_Points_Local(n,2) - src.y_center;

             end
        case {0 180 360} 
            for n = 1:32

                Array_Points_Local(n,1) = src.r*cosd(theta_wrapped);
                Array_Points_Local(n,2) = Array_Length_half-src.d*(n-1);

                Array_Points_Global(n,1) = Array_Points_Local(n,1) - src.x_center;
                Array_Points_Global(n,2) = Array_Points_Local(n,2) - src.y_center;

            end
        otherwise
            for n = 1:32

                k = Array_Length_half-(src.d*(n-1));
                
                Array_Points_Local(n,1) = x_cord(k);
                Array_Points_Local(n,2) = y_cord(k);

                Array_Points_Global(n,1) = Array_Points_Local(n,1) - src.x_center;
                Array_Points_Global(n,2) = Array_Points_Local(n,2) - src.y_center;

            end      
    end 
    
     theta_array = theta_array - (Difference/(src.Array_Total-1));
     plot(Array_Points_Global(:,1),Array_Points_Global(:,2), 'rx')
end
theta_array=0;
theta = theta + (360/src.matrix_s_num);
hold off

source_filename = sprintf('SOURCE_%06d',source_number-1);
fullfilename = strcat(src.name_of_source_file,source_filename);
savefig(fullfilename)

fullfilename = strcat(src.folder_for_para,'Pictures\',source_filename,'.png');
saveas(gcf,fullfilename)
fullfilename2 = strcat(src.folder_for_para,'Data\',source_filename,'.fig');
saveas(gcf,fullfilename2)

end
end