function transformador_calc_cli()
    
fprintf("\n\nCalculadora de parametros para transformadores...\n\n")

    NFases  = input("Tipo do Tranformador [Monofásico(0)/Trifásico(1)]: ");
Sn      = input("Potência Nominal [KVA]: ");
VNAT    = input("Tensão nominal em alta [V]: ");
VNBT    = input("Tensão nominal em baixa [V]: ");
V0      = input("Tensão do ensaio em vazio [V: ");
I0      = input("Corrente do ensaio em vazio [A]: ");
P0      = input("Potênciado ensaio em vazio [W]: ");
Vcc     = input("Tensão do ensaio de Curto Circuito [V]:");
Icc     = input("Corrente do ensaio de Curto Circuito [A]:");
Pcc     = input("Potência do ensaio de Curto Circuito [W]:");
SalvePlot = input("Deseja salvar os Grificos [s(1)/n(0)]?");

    

if NFases
    [OhmFig1, OhmFig2, OhmFig3, PuFig1, PuFig2, PuFig3, CompOhmPu, IMAX, RendMPC] =tranformador_trifasico( Sn, VNAT, VNBT, V0,I0, P0, Vcc, Icc, Pcc, 1, SalvePlot);
else  
    [OhmFig1, OhmFig2, OhmFig3, PuFig1, PuFig2, PuFig3, CompOhmPu, IMAX, RendMPC] =tranformador_monofasico( Sn, VNAT, VNBT, V0,I0, P0, Vcc, Icc, Pcc, 1, SalvePlot);
end




fprintf("\n\n_______________________________________")
fprintf("\nSimulação:")
if NFases
    fprintf("Trifásico")    
else  
    fprintf("Monofásico")    
end 
fprintf("\n_______________________________________\n")

fprintf("\n_______________________________________")
fprintf("\nValores Ohmicos:")
fprintf("\n_______________________________________")
fprintf("\n\nCircuito Completo")
fprintf("\nR_MA = %f", OhmFig1(1));
fprintf("\nX_MA = %f", OhmFig1(2));
fprintf("\nR_2A = %f", OhmFig1(3));
fprintf("\nX_2A = %f", OhmFig1(4));
fprintf("\nR_1 = %f", OhmFig1(5));
fprintf("\nX_1 = %f", OhmFig1(6));
fprintf("\nR_1B = %f", OhmFig1(7));
fprintf("\nX_1B = %f", OhmFig1(8));
fprintf("\nR_2 = %f", OhmFig1(9));
fprintf("\nX_2 = %f", OhmFig1(10));
fprintf("\nR_M = %f", OhmFig1(11));
fprintf("\nX_M = %f", OhmFig1(12));

fprintf("\n\nCircuito Simplificado 1")
fprintf("\nR_MA = %f", OhmFig2(1));
fprintf("\nX_MA = %f", OhmFig2(2));
fprintf("\nR_1TS = %f", OhmFig2(3));
fprintf("\nX_1S = %f", OhmFig2(4));
fprintf("\nR_M = %f", OhmFig2(5));
fprintf("\nX_M = %f", OhmFig2(6));
fprintf("\nR_1SB = %f", OhmFig2(7));
fprintf("\nX_1SB = %f", OhmFig2(8));

fprintf("\n\nCircuito Simplificado 2")
fprintf("\nR_1TS = %f", OhmFig3(1));
fprintf("\nX_1S = %f", OhmFig3(2));
fprintf("\nR_1SB = %f", OhmFig3(3));
fprintf("\nX_1SB = %f", OhmFig3(4));


fprintf("\n_______________________________________")
fprintf("\nValores PU:")
fprintf("\n_______________________________________")
fprintf("\n\nCircuito Completo")
fprintf("\nR_MPU = %f", PuFig1(1));
fprintf("\nX_MPU = %f", PuFig1(2));
fprintf("\nR_2APU = %f", PuFig1(3));
fprintf("\nX_2APU = %f", PuFig1(4));
fprintf("\nR_1PU = %f", PuFig1(5));
fprintf("\nX_1PU = %f", PuFig1(6));

fprintf("\n\nCircuito Simplificado 1")
fprintf("\nR_1STPU = %f", PuFig2(1));
fprintf("\nX_1SPU = %f", PuFig2(2));
fprintf("\nR_MPU = %f", PuFig2(3));
fprintf("\nX_MPU = %f", PuFig2(4));

fprintf("\n\nCircuito Simplificado 2")
fprintf("\nR_1STPU = %f", PuFig3(1));
fprintf("\nX_1SPU = %f", PuFig3(2));

fprintf("\n\nComparação:  Ohmico e PU")
fprintf("\nR_MPUB = %f", CompOhmPu(1));
fprintf("\nR_MPU = %f", CompOhmPu(2));
fprintf("\nX_MPUB = %f", CompOhmPu(3));
fprintf("\nX_MPU = %f", CompOhmPu(4));
fprintf("\nR_1TSPUB = %f", CompOhmPu(5));
fprintf("\nR_1STPU = %f", CompOhmPu(6));
fprintf("\nX_1SPUB = %f", CompOhmPu(7));
fprintf("\nX_1SPU = %f", CompOhmPu(8));

fprintf("\n\nRendimento:")
fprintf("\nI_2pu%% = %f", IMAX);
fprintf("\nRend_0.80%% = %f", RendMPC(1));
fprintf("\nRend_0.85%% = %f", RendMPC(2));
fprintf("\nRend_0.90%% = %f", RendMPC(3));
fprintf("\nRend_0.95%% = %f", RendMPC(4));
fprintf("\nRend_1.00%% = %f", RendMPC(5));
fprintf("\n\n")
