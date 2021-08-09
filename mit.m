function [r1, x1, RM, XM, r2l, x2l] =   mit(r1, Vn, F_N, N_p, V_T, I_T, P_T, V0, I0, P0, P_AV, P_out, fp, isPlot, isSalve)
                                        %mit(1.27, 220, 60, 1, 80, 9.12, 312, 0, 3.85, 235, 167, 2.2e3, 0.84, 1, 0)
    close all;
    if isSalve
        pathSave = uigetdir('','Selecione o diretorio para salvar os dados');
    end

    %Para fechamento em Y:
    %Circuito Equivalente -- II 
    
    P_j0 = 3*(0.5*r1)*I0^2;
    P_HF = P0 - P_j0 - P_AV;
    
    R_T = P_T/(3*I_T^2);
    Z_T = V_T/(sqrt(3)*I_T);
    X_T = sqrt(Z_T^2 - R_T^2);
    
    r_D = (3/2)*r1;
    
    r2l = R_T - r_D/3;
    x1 = 0.5*X_T;
    x2l = X_T - x1;
    E_1 = (Vn/sqrt(3)) - sqrt(r1^2 + x1^2)*I0;
    
    RM = (3*E_1^2)/P_HF;
    Z_M = E_1/I0;
    XM = (RM*Z_M)/sqrt(RM^2 - Z_M^2);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Curvas -- III
    
    n_sinc = 120*F_N/N_p; % Frequencia nominal, numero de par de polos
    n = 0:10:3790;
    
    s = (n_sinc - n)./n_sinc;
    r2 = r2l*s;
    Z_tot = r1+x1 + 1/((1/XM)+(1/(r2l+x2l)));
    
    I_1 = (Vn/sqrt(3))/Z_tot;
    
    P_in = sqrt(3)*Vn*I_1*fp;
    
    P_PCE = 3*I_1^2*r1;
    
    P_EF = P_in-P_PCE;
    
    P_conv = (1-s).*P_EF;
    
    %P_out = P_conv - P_AV;
    P_rot = P_conv-P_out;
    I_rot = P_rot./(Vn/sqrt(3));
    w_sinc = n_sinc.*2.*pi./60;
    
    t_carga = P_out./( w_sinc);
    
    %t_ind = P_EF/(n_sinc*2*pi/60);
    
    FP = (P_conv+P_PCE.*(1-s))./((1-s).*sqrt(3).*Vn.*I_1);
    
    efic = ((1-s).*P_EF-P_rot)./(sqrt(3).*Vn.*I_1.*FP);

    I_2 = (E_1)./(sqrt((r2l).^2+(x2l).^2));
    nm = (1 - s) * n_sinc;


    % Fonte... Confia
    v_th = (Vn/sqrt(3)) * (XM / sqrt(r1^2 + (x1 + XM)^2)) ;
    z_th = ((j*XM) * (r1 + j*x1)) / (r1 + j*(x1 + XM));
    r_th = real(z_th);
    x_th = imag(z_th);

    t_ind1 = (3 .* v_th.^2 .* r2l ./ s)./(w_sinc .* ((r_th + r2l./s).^2 + (x_th + x2l).^2));
    %
    
    if isPlot
        figure()
        sp = subplot(3,2,1)
        plot(nm, FP)
        sp.YAxis.TickLabelFormat='%.5f';
        title('Curva de fator de potência X Velocidade rotacional')
        xlabel('Velocidade rotacional (RPM)')
        ylabel('Fator de potência')

        subplot(2,2,2)
        plot(nm,t_ind1);
        title('Curva de conjugado do motor X Velocidade rotacional')
        xlabel('Velocidade rotacional (RPM)')
        ylabel('Conjugado do motor')

        subplot(2,2,3)
        plot(nm, P_conv)
        title('Curva de potência mecânica X Velocidade rotacional')
        xlabel('Velocidade rotacional (RPM)')
        ylabel('Potencia mecânica ')

        sp = subplot(2,2,4)
        plot(nm, efic)
        sp.YAxis.TickLabelFormat='%.5f';
        title('Curva de redimento X Velocidade rotacional')
        xlabel('Velocidade rotacional (RPM)')
        ylabel('Redimento')

    end
    if isSalve
        "Salve"
        f = figure('visible','off');
        p = plot(nm,FP)
        p.YAxis.TickLabelFormat='%.5f';
        titulo = 'Curva de fator de potência X Velocidade rotacional';
        title(titulo)
        xlabel('Velocidade rotacional (RPM)')
        ylabel('Fator de potência')
        saveas(f,  fullfile(pathSave, titulo),'png')
    
        f = figure('visible','off');
        plot(nm,t_ind1)
        titulo = 'Curva de conjugado do motor X Velocidade rotacional';
        title(titulo)
        xlabel('Velocidade rotacional (RPM)')
        ylabel('Conjugado do motor')
        saveas(f,  fullfile(pathSave, titulo),'png')
    
   
        f = figure('visible','off');
        plot(nm, P_out)
        titulo = 'Curva de potência mecânica X Velocidade rotacional';
        title(titulo)
        xlabel('Velocidade rotacional (RPM)')
        ylabel('Potencia mecânica ')
        saveas(f,  fullfile(pathSave, titulo),'png')
    
    
        f = figure('visible','off');
        p = plot(nm, efic)
        p.YAxis.TickLabelFormat='%.5f';
        titulo = 'Curva de redimento X Velocidade rotacional';
        title(titulo)
        xlabel('Velocidade rotacional (RPM)')
        ylabel('Redimento')
        saveas(f,  fullfile(pathSave, titulo),'png')
    
    end
end