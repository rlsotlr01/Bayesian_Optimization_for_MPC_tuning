function self_ChangeDir(subFileName)
%%% Function self_ChangeDir(subFileName)
%   Change the current directory to sub file
%   Ex: self_ChangeDir('Data_mat Format');
numOfInput=nargin;
disp(numOfInput)
switch numOfInput
case 0,
    pathName=cd;
    posOfSlide=findstr(pathName,'\');
    pathName=pathName([1:posOfSlide(length(posOfSlide))]);
    cd(pathName);
case 1,
    pathName=cd;
	pathName=[pathName,'\',subFileName];
	cd(pathName);
otherwise,
    error('The number of input argument is wrong in Function self_ChangeDir');
end
