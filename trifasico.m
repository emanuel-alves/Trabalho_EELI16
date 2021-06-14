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
XM_3 = V0_3/I0Q_3
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

