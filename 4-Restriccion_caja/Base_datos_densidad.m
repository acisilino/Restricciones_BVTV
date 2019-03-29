
% Genera base de datos de densidad donde luego buscar la restriccion
% de caja

npasos=200;
dp=1/npasos;
nmicros=0;

for i=1:npasos
    for j=1:npasos
        for k=1:npasos
            
            tc=i*dp;
            th=j*dp;
            tv=k*dp;
   
            if th>=tc && tv>=tc
                nmicros=nmicros+1;
                
                dataden(nmicros,1)=tc;
                dataden(nmicros,2)=th;   
                dataden(nmicros,3)=tv;
                dataden(nmicros,4)=density([tc th tv]);
                
            end
            
            
        end
    end
end
            