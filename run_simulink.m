function funcc = run_simulink(vars)

    Ts = vars.opt_Ts/100; % make the time interval as 0.01
    N = vars.opt_N; % prediction horizon
    wd = vars.opt_wd;

    wv = vars.opt_wv;
    wa = vars.opt_wa;
    wu = vars.opt_wu;
    wdu = vars.opt_wdu;

    save bayes_param.mat
    Load_BestRun_Parameters2;
    w1 = 1; % weight for the TEI
    w2 = 1/48.388; % weight for the FE

    mdl = "BestRun_VehicleModel_pntwo";
    in = Simulink.SimulationInput(mdl);
    in = in.loadVariablesFromMATFile('bayes_param.mat');
    out = sim(in);


    %FE.Data(end)+TEI.Data(end)
    TEI = out.TEI;
    FE = out.FE;
    plot(TEI)
    plot(FE)
    hold on;
    legend()
    xlabel('Time')
    TEI_obj = TEI.data(end);
    FE_obj = FE.data(end);
    funcc = w1*TEI_obj+w2*FE_obj;
    % FE high -> better solution
    % TEI low -> better solution
    % Therefore, Maximum FE, minimum TEI
    disp(funcc)

    delete bayes_param.mat
    clear TEI_obj
    clear FE_obj
    clear N
end

