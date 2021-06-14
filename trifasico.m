% Trabalho 1 -- Maquinas Eletricas I %
% Codigo base de calculos %

clc, close all, clear all;

% Parametros lidos %
% Trifásico %

SN_3 = 45e3
VNAT_3 = 23.1e3
VNBT_3 = 380
V0_3 = 380
I0_3 = 2.46
P0_3 = 215
Vcc_3	= 900.90
Icc_3 = 1.12
Pcc_3 = 704.52
T_3 = 75 % nao dado

% Topico 2 %
%Figura 1%

RM_3 = (V0_3^2)/P0_3
I0P_3 = (V0_3/sqrt(3))/RM_3
I0Q_3 = sqrt(I0_3^2 - I0P_3^2)
XM_3 = (V0_3/sqrt(3))/I0Q_3
%ZM_3 = (V0_3/sqrt(3))/I0_1

Z1S_3 = (Vcc_3/sqrt(3))/Icc_3
R1S_3 = (Pcc_3/3)/Icc_3^2
X1S_3 = (sqrt(Z1S_3^2 - R1S_3^2))
R1TS_3 = (235 + T_3)/(235 + 25)*R1S_3
Z1TS_3 = sqrt(R1TS_3^2 + X1S_3^2)

R2A_3 = R1TS_3/2
X2A_3 = X1S_3/2
R1_3 = R1TS_3/2
X1_3 = X1S_3/2

a = (VNAT_3/VNBT_3)

% Referindo ao lado de alta
RMA_3 = a^2*RM_3
XMA_3 = a^2*XM_3

% Referindo ao lado de baixa
R1B_3 = R1_3/a^2
X1B_3 = X1_3/a^2
R2_3 = R2A_3/a^2
X2_3 = X2A_3/a^2

% Referindo ao lado de alta
RMA_3
XMA_3
R1S_3
X1S_3

% Referindo ao lado de baixa
RM_3
XM_3
R1SB_3 = R1S_3/a^2
X1SB_3 = X1S_3/a^2

%Figura 3%

% Referindo ao lado de alta
R1S_3
X1S_3

% Referindo ao lado de baixa
R1SB_3
X1SB_3


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Topico 3 %
%Figura 1%

RMPU_3 = SN_3/P0_3
RMPC_3 = RMPU_3*100
Q0_3 = sqrt((sqrt(3)*V0_3*I0_3)^2 - P0_3^2)
XMPU_3 = SN_3/Q0_3
XMPC_3 = XMPU_3*100

R1SPU_3 = Pcc_3/SN_3
R1SPC_3 = R1SPU_3*100
Z1SPU_3 = Vcc_3/VNAT_3
Z1SPC_3 = Z1SPU_3*100
X1SPU_3 = sqrt(Z1SPU_3^2 - R1SPU_3^2)
X1SPC_3 = X1SPU_3*100
R1STPU_3 = (235 + T_3)/(235 + 25)*R1SPU_3
R1STPC_3 = R1STPU_3*100
Z1STPU_3 = sqrt(R1STPU_3^2 + X1SPU_3^2)
Z1STPC_3 = Z1STPU_3*100

%Figura 1%

R2APU_3 = R1STPU_3/2
X2APU_3 = X1SPU_3/2
R1PU_3 = R1STPU_3/2
X1PU_3 = X1SPU_3/2
RMPU_3
XMPU_3

%Figura 2%

R1STPU_3
X1SPU_3
RMPU_3
XMPU_3

%Figura 3%

R1STPU_3
X1SPU_3

% Comparando com o topico b
fprintf("Comparando")
RMPUB_3 = RM_3/(((V0_3)^2)/SN_3)
RMPU_3
XMPUB_3 = XM_3/(((V0_3)^2)/SN_3)
XMPU_3
R1TSPUB_3 = R1TS_3/(VNAT_3^2/SN_3)
R1STPU_3
X1SPUB_3 = X1S_3/(VNAT_3^2/SN_3)
X1SPU_3
