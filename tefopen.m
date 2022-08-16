clc;
clear;
fid=fopen('balons11.txt');
%formatSpec='%6d\n %6d\n %6d\n'
%A1=fscanf(fid,formatSpec)

file_data=textscan(fid,'%s');
fclose(fid);
file_data{1,7}

   %row=length(file_data{7})
    %{
lla=file_data{1};
llo=file_data{1};
index=file_data{1};
    
    for j=1:100
for i=1:row
    
    X(j,i)=str2num(cell2mat(llo(ii)));
     Y(1,ii)=str2num(cell2mat(lla(ii)));
    
end
    end
disp(X);
%}