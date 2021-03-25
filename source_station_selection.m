
for k = 1:length(matrix_events)
    
s_num = matrix_events(k);    
source_filename = sprintf('SOURCE_%06d',s_num-1);
frompath=strcat(folder_for_para,source_filename)
source_filename2 = sprintf('SOURCE_%06d',k-1);
topath = strcat(folder_for_para,'bk/',source_filename2);
%fileID = fopen(parafullpath,'w');
copyfile(frompath,topath,'f')


stations_filename = sprintf('STATIONS_%06d',s_num-1);
frompath=strcat(folder_for_para,stations_filename)
stations_filename2 = sprintf('STATIONS_%06d',k-1);
topath = strcat(folder_for_para,'bk/',stations_filename2);
%fileID = fopen(parafullpath,'w');
copyfile(frompath,topath,'f')
    
end