

              if flag_plot ==1
                fig=figure(1);
                title(['Fan-Beam ' num2str(i)]);
                xlabel('x (mm)'); ylabel('y (mm)');
%                 labels = ()
                labels= cellstr(num2str([1:length(stations.RecPos(:,1))]'))
                %Plot array elements
                subplot(1,1,1);
                plot(src.source_center_x,src.source_center_y,'r+');hold on;
                plot(stations.RecPos(:,1),stations.RecPos(:,2),'b.');hold on;
                text(stations.RecPos(:,1),stations.RecPos(:,2),labels);hold on;
                
                %plot(xr,yr,'b.');
                %rectangle('Position',[-0.1 -0.1 0.1 0.1],'Curvature',1);
                title(['i=',num2str(i),' k=',num2str(k)]);
                
                %plot the path between emitter and receiver
                %plot([s(k) xr(l)],[ye(k) yr(l)],'k');        
                axis equal; 
%                 axis([-0.02 0.02 -0.02 0.02]);
                hold off;
                
                figname = sprintf('Sfan%02dscan%02d',i,k);
                figfullname = strcat(folder_for_para,figname)
                
                
                saveas(fig,figfullname,'tif');
%                 close all;
                end %  if flag_plot ==1