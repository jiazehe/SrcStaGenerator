fprintf(fileID,'FORCE  0\n');
fprintf(fileID,'time shift:      0.0000 \n');
fprintf(fileID,'f0:  %6.3f \n',src.f0);
xs_str = sprintf('latorUTM:          %6.5f \n', Rec.RecPos(s_num,1));
fprintf(fileID,xs_str);
ys_str = sprintf('longorUTM:         %6.5f \n', Rec.RecPos(s_num,2));
fprintf(fileID,ys_str);
zs_str = sprintf('depth:             %6.5f \n', Rec.RecPos(s_num,3));
fprintf(fileID,zs_str);
fprintf(fileID,'factor force source:              1.d0 \n');
fprintf(fileID,'component dir vect source E:      0.d0 \n');
fprintf(fileID,'component dir vect source N:      0.d0 \n');
fprintf(fileID,'component dir vect source Z_UP:   1.d0 \n');
fprintf(fileID,name_of_source_file_str);