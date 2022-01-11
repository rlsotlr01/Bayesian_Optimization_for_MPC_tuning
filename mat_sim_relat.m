% Variables for a Bayesian Optimization
Load_BestRun_Parameters2;

X1 = optimizableVariable('opt_Ts',[1 10], 'Type','integer');
X2 = optimizableVariable('opt_N',[10 100],'Type','integer');
X3 = optimizableVariable('opt_wd',[0.8 1.5],'Type','real');
X4 = optimizableVariable('opt_wv',[0 0.1],'Type','real');
X5 = optimizableVariable('opt_wa',[0 0.1],'Type','real');
X6 = optimizableVariable('opt_wu',[2 5],'Type','real');
X7 = optimizableVariable('opt_wdu',[0.8 1.5],'Type','real');
vars = [X1,X2,X3,X4,X5,X6,X7];
% If you want to optimize all variables,
% vars = [X1,X2,X3,X4,X5,X6,X7];

obj_func = @run_simulink
% Function to Optimize
results = bayesopt(obj_func,vars, ...
    'UseParallel',false, ...
    'AcquisitionFunctionName','expected-improvement-plus' ...
    ,'MaxObjectiveEvaluations',1200);
                                                                                                                                                                                                                                                                                                                             
save results_wo_const_1223_TEI1_48FE1obj_1200tr.mat results




