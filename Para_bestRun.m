%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mazda AT Passenger vehicle parameters
%%% 2008.09. 15
%%% By Shengbo LI

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �����ṹ��������������ѧ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Mass    = 1645;  % [kg]
invMass = Mass; 
%��������ϵ��,ָcd*A,�����������㹫ʽ�г��ٵ�λΪkm/h
Aera=  2.22;                     %ӭ�����m.m
Cd  =   0.7153/Aera*0.8;         %����ϵ����kg/m^2
Yita =  0.04;
fRoll   = 0.1712/9.81;
RofW = 0.98*0.307;  % ���ְ뾶
pho    = 1.29; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��������Һ�����������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Iei   = 0.211+0.001; % ��������ת������(kg.m^2)
eThrAng      = [15,18.5,21,22 24 25 30 32.5 35 37.5 40,45,50:10:100]; % (%)
eEngSpd     = [1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500];% rpm
eTorq   =1.1*[
-10.5	22.566	55.4	72.375	80.905	84.541	93.176	96.165	101.93	105.65	109.36	116.11	117.87	121.39	124.91	128.42	131.94	133.7
-25.75	6.6041	24.56	44.891	62.878	75.359	92.84	102.75	111.5	115.75	117.01	119.52	122.04	126.88	131.54	136.21	140.87	143.3
-41	3.3281	18.891	36.655	50.868	63.505	81.141	104.88	115.69	130.4	132.2	135.81	139.42	145.51	150.42	155.33	160.24	162.7
-41	-1.78	10.1	26.473	39.247	53.173	72.1	92.4	119.2	129.7	134.13	142.98	145.96	149.68	153.4	157.12	160.84	162.7
-42	-2.5458	9.6379	25.444	34.482	42.641	55.8	90.514	116.3	133.21	143.56	146.77	148.86	153.05	157.23	161.42	165.61	167.7
-42	0.19685	14.418	28.162	33.347	39.988	51.629	79.773	118.78	146.8	156.3	161.43	163.08	166.4	169.71	173.03	176.34	178
-42	-0.4394	13.78	27.18	31.098	36.234	46.37	75	119.23	137.74	152.6	161.17	162.97	166.58	170.19	173.79	177.4	179.2
-42	3.2828	19.22	33.252	41.69	53.97	71.25	110.37	132.03	147.64	160.54	162.45	164.36	168.18	172.01	175.83	179.65	181.6
-42	-1.2142	13.155	26.411	29.995	34.898	44.8	83.213	117.49	135.35	149.65	160.83	162.44	165.64	168.85	172.06	175.26	176.9
-42	-3.2079	10.508	23.592	27.973	34.986	47	72.75	108.74	127.71	142.77	159.28	161.1	163	164.91	166.82	168.73	169.7
-42	-4.5	9.3333	22.907	25.786	28.325	35.865	71.8	97.114	117.99	132.88	145.63	147.28	150.58	153.88	157.18	160.48	162.2
-42	-6.4106	7.5437	20.238	21.23	22.63	29.03	68.21	88.291	105.08	119.74	131.44	133.29	137	140.7	144.41	148.11	150
];

%%% Bestrun Torque Converter
rotation_ratio= [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.75 0.8 0.85 0.9 0.92 0.94 1];
torque_ratio= [1.706 1.609 1.538 1.464 1.384 1.314 1.237 1.153 1.103 1.054 0.999 0.989 0.989 0.985 0.985];
capacity = 1*10e-4*[3.48 3.692 3.796 3.834 3.851 3.818 3.552 3.114 2.891 2.636 2.406 1.722 1.416 1.072 0]; % Nm/(rpm)^2
lenOfTC=length(rotation_ratio);
invTCratio=fliplr(rotation_ratio([(lenOfTC-5):lenOfTC]));
invTCCapacity=fliplr(capacity([(lenOfTC-5):lenOfTC]));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����ϵ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% transmission ratio 
gR0    =    3.863;   % Final drive
gRg1   =    3.620;  % 1st gear
gRg2   =    1.925;  % 2nd gear
gRg3   =    1.285;  % 3rd gear
gRg4   =    0.936;  % 4th gear
gRg5   =    0.667;  % 5th gear
%������������
Troffset=0;
Thr12=[0 7.64 87.5 100]+Troffset;%Throttle,%
V12=[10 10 46.45 46.45]/3.6;%Vehicle Speed, m/s
Thr23=[0 6.53 12.5 19.72 50 78.47 100]+Troffset;
V23=[21.9 21.9 24.8 30.3 58.2 91.6 91.6]/3.6;
Thr34=[0 12.5 18.75 36.25 48.6 68 100]+Troffset;
V34=[38.3 38.3 43.4 64.8 91.6 136.8 136.8]/3.6;
Thr45=[0 6.53 15.28 36.25 48.6 100]+Troffset;
V45=[52.9 52.9  64.8 109.7 207.3 207.3]/3.6;
Thr54=[0 18.75 24.3 32.64 80.5 100]+Troffset;
V54=[49.7 49.7 52.9 64.8 189.4 189.4]/3.6;
Thr43=[0 19.72 44.7 84.7 100]+Troffset;
V43=[24.8 24.8 60 110 110]/3.6;
Thr32=[0 19.72 24.3 87.5 100]+Troffset;
V32=[8.3 8.3 20 83.3 83.3]/3.6;
Thr21=[0 62.5 87.5 100]+Troffset;
V21=[8.3 8.3 38.3 38.3]/3.6;
% figure(100); hold on;
% plot(V12, Thr12,'r',V23, Thr23,'r',V34, Thr34,'r',V45, Thr45,'r');
% plot(V21, Thr21,'b',V32, Thr32,'b',V43, Thr43,'b',V54, Thr54,'b');
% xlabel('Speed(m/s)'); ylabel('Throttle(%)');
% wanting
TWAIT=2;% ����ʱ�����
etaT=0.92;% ����ϵЧ��

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �ƶ�ϵ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

BETT=0.5*(0.878+0.844)*Mass*RofW;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Engine SFC Map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
deltM=1+Yita+Iei*etaT/(Mass*RofW^2)*(gR0*[gRg1,gRg2,gRg3,gRg4,gRg5]).^2; 

