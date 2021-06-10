% Trabalho 1 -- Maquinas Eletricas I %
% Codigo base de calculos %

clc, close all, clear all;

% Parametros lidos %
% Monofasico %


SN_1 = 15e3
VNAT_1 = 13.34e3
VNBT_1 = 220
V0_1 = 220
I0_1 = 2.05
P0_1 = 75
Vcc_1	= 320.16
Icc_1 = 1.12
Pcc_1 = 243.23
T_1 = 75 % nao dado

								
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
R1S_1
X1S_1

% Referindo ao lado de baixa
RM_1
XM_1
R1SB_1 = R1S_1/a^2
X1SB_1 = X1S_1/a^2

%Figura 3%

% Referindo ao lado de alta
R1S_1
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

R1SPU_1
X1SPU_1
RMPU_1
XMPU_1

%Figura 3%

R1SPU_1
X1SPU_1


% Comparando com o topico b

RMPUB_1 = RM_1/(VNBT_1^2/SN_1)
XMPUB_1 = XM_1/(VNBT_1^2/SN_1)
R1TSPUB_1 = R1TS_1/(VNAT_1^2/SN_1)
X1SPUB_1 = X1S_1/(VNAT_1^2/SN_1)