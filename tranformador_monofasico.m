function [saidas] = tranformador_monofasico(SN_1,VNAT_1,VNBT_1,V0_1,I0_1,P0_1,Vcc_1,Icc_1,Pcc_1, isPlot, isSalve)
    T_1 = 75 % nao dado

    if isSalve
        pathSave = uigetdir('','Selecione o diretório para salvar os dados');
    end
% Topico 2 %
%Figura 1%

RM_1 = (V0_1^2)/P0_1
ZM_1 = V0_1/I0_1
I0P_1 = V0_1/RM_1
I0Q_1 = sqrt(I0_1^2 - I0P_1^2)
XM_1 = V0_1/I0Q_1

R1S_1 = (Pcc_1/Icc_1^2)
Z1S_1 = (Vcc_1/Icc_1)
X1S_1 = (sqrt(Z1S_1^2 - R1S_1^2))
R1TS_1 = (235 + T_1)/(235 + 25)*R1S_1
Z1TS_1 = sqrt(R1TS_1^2 + X1S_1^2)

R2A_1 = R1TS_1/2
X2A_1 = X1S_1/2
R1_1 = R1TS_1/2
X1_1 = X1S_1/2

a = (VNAT_1/VNBT_1)

% Referindo ao lado de alta
RMA_1 = a^2*RM_1
XMA_1 = a^2*XM_1

% Referindo ao lado de baixa
R1B_1 = R1_1/a^2
X1B_1 = X1_1/a^2
R2_1 = R2A_1/a^2
X2_1 = X2A_1/a^2

%Figura 2%

% Referindo ao lado de alta
RMA_1
XMA_1
R1TS_1
X1S_1

% Referindo ao lado de baixa
RM_1
XM_1
R1SB_1 = R1TS_1/a^2
X1SB_1 = X1S_1/a^2

%Figura 3%

% Referindo ao lado de alta
R1TS_1
X1S_1

% Referindo ao lado de baixa
R1SB_1
X1SB_1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Topico 3 %
%Figura 1%

RMPU_1 = SN_1/P0_1
RMPC_1 = RMPU_1*100
Q0_1 = sqrt((V0_1*I0_1)^2 - P0_1^2)
XMPU_1 = SN_1/Q0_1
XMPC_1 = XMPU_1*100

R1SPU_1 = Pcc_1/SN_1
R1SPC_1 = R1SPU_1*100
Z1SPU_1 = Vcc_1/VNAT_1
Z1SPC_1 = Z1SPU_1*100
X1SPU_1 = sqrt(Z1SPU_1^2 - R1SPU_1^2)
X1SPC_1 = X1SPU_1*100
R1STPU_1 = (235 + T_1)/(235 + 25)*R1SPU_1
R1STPC_1 = R1STPU_1*100
Z1STPU_1 = sqrt(R1STPU_1^2 + X1SPU_1^2)
Z1STPC_1 = Z1STPU_1*100

R2APU_1 = R1STPU_1/2
X2APU_1 = X1SPU_1/2
R1PU_1 = R1STPU_1/2
X1PU_1 = X1SPU_1/2


%Figura 2%

R1STPU_1
X1SPU_1
RMPU_1
XMPU_1

%Figura 3%

R1STPU_1
X1SPU_1


% Comparando com o topico b

RMPUB_1 = RM_1/(VNBT_1^2/SN_1)
RMPU_1
XMPUB_1 = XM_1/(VNBT_1^2/SN_1)
XMPU_1
R1TSPUB_1 = R1TS_1/(VNAT_1^2/SN_1)
R1STPU_1
X1SPUB_1 = X1S_1/(VNAT_1^2/SN_1)
X1SPU_1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Topico 4 %

fp = [0.8 0.85 0.9 0.95]

phi = acos(fp)

IPU_1 = 0:0.05:1

RegPU_1_1 = IPU_1.*(cos(phi(1))*R1STPU_1 + sin(phi(1))*X1SPU_1)
RegPU_1_2 = IPU_1.*(cos(phi(2))*R1STPU_1 + sin(phi(2))*X1SPU_1)
RegPU_1_3 = IPU_1.*(cos(phi(3))*R1STPU_1 + sin(phi(3))*X1SPU_1)
RegPU_1_4 = IPU_1.*(cos(phi(4))*R1STPU_1 + sin(phi(4))*X1SPU_1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Topico 5 %

fp = [0.8 0.85 0.9 0.95]

phi = acos(fp)

IPU_1 = 0:0.05:1


RegPU_1_1 = IPU_1.*(cos(phi(1))*R1STPU_1 - sin(phi(1))*X1SPU_1)
RegPU_1_2 = IPU_1.*(cos(phi(2))*R1STPU_1 - sin(phi(2))*X1SPU_1)
RegPU_1_3 = IPU_1.*(cos(phi(3))*R1STPU_1 - sin(phi(3))*X1SPU_1)
RegPU_1_4 = IPU_1.*(cos(phi(4))*R1STPU_1 - sin(phi(4))*X1SPU_1)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Topico 6 %

fp = [0.8 0.85 0.9 0.95]

phi = acos(fp)

IPU_1 = 0:0.05:1

RegPU_1_1 = IPU_1.*R1STPU_1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Graficos%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isPlot
    figure('units','normalized','outerposition',[0 0 1 1]);
    
    %%% Topico 4
    subplot(2,2,1)
    plot(IPU_1,RegPU_1_1,IPU_1,RegPU_1_2,IPU_1,RegPU_1_3,IPU_1,RegPU_1_4)
    grid on
    title('Regula��o de tens�o | Carga indutiva-resistiva')
    ylabel('Reg_{PU}')
    xlabel('I_{PU}')
    legend('fp = 0.8','fp = 0.85','fp = 0.9','fp = 0.95')
    
    %%% Topico 5
    
    subplot(2,2,2)
    plot(IPU_1,RegPU_1_1,IPU_1,RegPU_1_2,IPU_1,RegPU_1_3,IPU_1,RegPU_1_4)
    grid on
    title('Regula��o de tens�o | Carga capacitiva-resistiva')
    ylabel('Reg_{PU}')
    xlabel('I_{PU}')
    legend('fp = 0.8','fp = 0.85','fp = 0.9','fp = 0.95')
    
    %%% Topico 6
    
    subplot(2,2,4)
    plot(IPU_1,RegPU_1_1)
    grid on
    title('Regula��o de tens�o | Carga resistiva')
    ylabel('Reg_{PU}')
    xlabel('I_{PU}')
    legend('fp = 1')


end
if isSalve
    f = figure('visible','off');
    plot(IPU_1,RegPU_1_1,IPU_1,RegPU_1_2,IPU_1,RegPU_1_3,IPU_1,RegPU_1_4)
    grid on
    title('Regula��o de tens�o | Carga indutiva-resistiva')
    ylabel('Reg_{PU}')
    xlabel('I_{PU}')
    legend('fp = 0.8','fp = 0.85','fp = 0.9','fp = 0.95')
    saveas(f,  fullfile(pathSave, 'plot_1'),'png')

    %%% Topico 5
    
    f = figure('visible','off');
    plot(IPU_1,RegPU_1_1,IPU_1,RegPU_1_2,IPU_1,RegPU_1_3,IPU_1,RegPU_1_4)
    grid on
    title('Regula��o de tens�o | Carga capacitiva-resistiva')
    ylabel('Reg_{PU}')
    xlabel('I_{PU}')
    legend('fp = 0.8','fp = 0.85','fp = 0.9','fp = 0.95')
    saveas(f,  fullfile(pathSave, 'plot_2'),'png')


    %%%
    
    % Plotagem da regula��o de tens�o
    f = figure('visible','off');
    %figure('Name','Regula��o de tensao para carregamentos resistivo-capacitivos','NumberTitle','off','Position',[500 100 800 600])
    plot(amps,I(1,:),'b');
    hold on;
    plot(amps,I(2,:),'k');
    plot(amps,I(3,:),'r');
    plot(amps,I(4,:),'m');
    
    grid on;
    title ('Regula��o de Tens�o Versus Carga (resistivo-capacitivo)');
    xlabel ('Caregamento(A)');
    ylabel ('Regula��o de Tens�o (%)');
    legend({'FP 0,8 adiantado','FP 0,85 adiantado','FP 0,9 adiantado', 'FP 0,95 adiantado'},'Location','best');
    hold off;
    saveas(f,  fullfile(pathSave, 'plot_3'),'png')


    
    %%% Topico 6
    
    
    f = figure('visible','off');
    plot(IPU_1,RegPU_1_1)
    grid on
    title('Regula��o de tens�o | Carga resistiva')
    ylabel('Reg_{PU}')
    xlabel('I_{PU}')
    legend('fp = 1')
    saveas(f,  fullfile(pathSave, 'plot_4'),'png')


end
end
