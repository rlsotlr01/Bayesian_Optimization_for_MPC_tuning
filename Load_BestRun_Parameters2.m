%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Load Parameters for BestRun Passenger Car
%%% Created by Shengbo Li, 2008.10.05
%%% Revised by Shengbo Li, 2021,08.13
%%% Tsinghua University, School of Vehicle and Mobility


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Please run to load parameters
clc;clear;close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Load PV speed profile
load('Data_PV Speed.mat');
load('Data_RoadSlope.mat');
Road_Data=Road_Data';

%%% Load engine parameters
Para_bestRun;
Para_engine_FC; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxWe=eEngSpd;  %rpm
maxTe=eTorq(:,length(eTorq(1,:)));       %Nm
minWe=eEngSpd;  %rpm
minTe=eTorq(:,1);       %Nm
We=eEngSpd;
eTorq=self_MAPfilter(eTorq, 0.5);
Te=eTorq;
ThrAng=eThrAng;
%%% Modify Engine Torque of SFC MAP
meanMaxTe1=mean(orgTe(length(orgTe(:,1)),:));
meanMaxTe2=mean(maxTe);
orgTe = orgTe * meanMaxTe2/meanMaxTe1;
sfcTe = sfcTe * meanMaxTe2/meanMaxTe1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Calculate Inverse engine Torque map 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Te--Nm, We--rpm,invQ
invWe=500:250:6500; %% rpm
invTe=-40:5:190;     %% Nm
len_We=length(invWe); len_Te=length(invTe);
for m=1:len_We
    for n=1:len_Te
       %%% Calculate InvEngMap value according to We and Te
       invThrAng(m,n)=self_CalRow(invWe(m),invTe(n),ThrAng,We,Te);
   end 
end
invThrAng=self_MAPfilter(invThrAng,0.5);


close all;