function [O_r1, O_x1, O_RM, O_XM, O_r2, O_x2] = mit(P_HP,V_ND,V_NY,I_ND,I_NY,F_N,n_N,N_p,rend,fp,fs,cat,iso,regi,r1_L,V_L,I_L,P_L,P_AV,V_T,I_T,P_T)

    %Para fechamento em Y:
    %Circuito Equivalente -- II
    
    P_j3 = 3*(0.5*r_L)*I_L^2;
    P_HF = P_L - P_j3 - P_AV;
    
    R_T = P_T/(3*I_T^2);
    Z_T = V_T/(sqrt(3)*I_T);
    X_T = sqrt(Z_T^2 - R_T^2);
    
    r_D = 3/2*r1_L;
    
    O_r1 = r1_L;
    O_r2 = R_T - r_D/3;
    O_x1 = 0.5*X_T;
    O_x2 = X_T - O_x1;
    
    E_1 = V_NY - sqrt(r1_L^2 + O_x1^2)*I_L;
    
    O_RM = (3*E_1^2)/P_HF;
    Z_M = E_1/I_L;
    O_XM = (O_RM*Z_M)/sqrt(O_RM^2 - Z_M^2);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Curvas -- III
    
    n_sinc = 120*F_N/N_p;
    
    n = 0:10:3790;
    
    Z_tot = O_r1+O_x1 + 1/((1/O_XM)+(1/(O_r2+O_x2)));
    
    I_1 = V_NY/sqrt(3)/Z_tot;
    
    P_in = sqrt(3)*V_T*I_1*fp;
    
    P_PCE = 3*I_1^2*O_r1;
    
    P_EF = P_in-P_PCE;
    
    s = (n_sinc - n)./n_sinc
    
    P_conv = (1-s).*P_EF;
    
    P_out = P_conv - P_AV;
    
    t_carga = P_out./(n.*2*pi/60);
    
    t_ind = P_EF/(n_sinc*2*pi/60);
    
    FP = (P_conv.*P_EF - P_AV)./(1-s).*sqrt(3).*V_T.*I_1;
    
    efic =((1-s).*P_EF-P_AV)./(sqrt(3).*V_T.*I_1.*FP).*100;
    
    subplot(3,2,1)
    plot(FP,n)
    title('Curva de fator de potência X Velocidade rotacional')
    xlabel('Velocidade rotacional (RPM)')
    ylabel('Fator de potência')
    
    subplot(3,2,2)
    plot(t_carga,n)
    title('Curva de conjugado do motor X Velocidade rotacional')
    xlabel('Velocidade rotacional (RPM)')
    ylabel('Conjugado do motor')
    
    subplot(3,2,3)
    plot(P_out,n)
    title('Curva de potência mecânica X Velocidade rotacional')
    xlabel('Velocidade rotacional (RPM)')
    ylabel('Potencia mecânica ')
    
    subplot(3,2,4)
    plot(efic,n)
    title('Curva de redimento X Velocidade rotacional')
    xlabel('Velocidade rotacional (RPM)')
    ylabel('Redimento')
    
    subplot(3,2,5)
    plot(,n)
    title('Curva de corrente do estator X Velocidade rotacional')
    xlabel('Velocidade rotacional (RPM)')
    ylabel('Corrente no estator')
    
    subplot(3,2,6)
    plot(,n)
    title('Curva de corrente no rotor X Velocidade rotacional')
    xlabel('Velocidade rotacional (RPM)')
    ylabel('Corrente no rotor')
    
    
    
    
    
    
    
    
    


end