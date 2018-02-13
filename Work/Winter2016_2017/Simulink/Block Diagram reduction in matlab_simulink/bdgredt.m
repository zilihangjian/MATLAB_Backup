
   SYS=linmod('BD12');
    Tss=ss(SYS.a,SYS.b,SYS.c,SYS.d);
    [n,d]=tfdata(Tss,'v');
    T=tf(n,d);
    
fic1='filname'
new_system(fic1)
open_system(fic1)
add_block('simulink/Sources/Step','filname/step1')
add_block('simulink/Continuous/Transfer Fcn','filname/syst1')
set_param('filname/step1','Position', [10 150 40 180 ] )
set_param('filname/syst1','Denominator','(d)')
set_param('filname/syst1','Numerator','(n)')
add_block('simulink/Sinks/Scope','filname/Scope')
set_param('filname/Scope','Position', [200 350 230 380 ] )
add_line('filname','syst1/1','Scope/1');
add_line('filname','step1/1','syst1/1');
save_system(fic1);
