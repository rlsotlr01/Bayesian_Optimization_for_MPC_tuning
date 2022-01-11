% to be optimized
Ts = 0.1;   %sample time  [0.01,0.1]
N = 50;    %step number  [10,100]
wd = 1;     %weight of distance error [0.8,1.5]
wv = 0.01;     %weight of speed error    [0,0.1]
wa = 0;   %weight of FV acceleration[0,0.1]
wu = 4;     %weight of desired acceleration[2,5]
wdu = 1;    %weight of dot desired acceleration[0.8,1.5]