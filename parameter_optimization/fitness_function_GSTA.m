function y = fitness_function_GSTA(x)
persistent runnng_time
if isempty(runnng_time)
   runnng_time=-1;
end
numSims  = numel(x(:,1));
simIn(1:numSims) = Simulink.SimulationInput('parallel_simulink_MOO_GSTA');
for i = 1:numSims
simIn(i)= simIn(i).setBlockParameter('parallel_simulink_MOO_GSTA/k1',  'Value', num2str(x(i,1)),...
                                     'parallel_simulink_MOO_GSTA/k2',  'Value', num2str(x(i,2)),...
                                     'parallel_simulink_MOO_GSTA/mu1', 'Value', num2str(x(i,3)),...
                                     'parallel_simulink_MOO_GSTA/mu2', 'Value', num2str(x(i,4)));        
end
out = parsim(simIn,'ShowSimulationManager','on',...
                   'ShowProgress','off');
y=zeros(numSims,2);    

for j = 1:numSims    
    y(j,1)=out(1,j).RMSE;
    y(j,2)=out(1,j).INTC;
end
 
runnng_time=runnng_time+1

save pareto_x x
end
