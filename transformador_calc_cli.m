function transformador_calc_cli()
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
       tranformador_trifasico( Sn, VNAT, VNBT, V0,I0, P0, Vcc, Icc, Pcc, 1, SalvePlot)
else  
    tranformador_monofasico( Sn, VNAT, VNBT, V0,I0, P0, Vcc, Icc, Pcc, 1, SalvePlot)
end