function [density_numer1,density_numer2] = split_digits(originalNum)



density_col={num2str([originalNum],'%.1f ')  };  %)"1000.0"
density_col_split=split(density_col,".");
density_numer1 = str2double(density_col_split(1,1:end));   
density_numer2 = str2double(density_col_split(2,1:end));   
