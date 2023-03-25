FitnessFunction = @fitness_function_GSTA; % Function handle to the fitness function
nvars =4;    % Number of variables
lb = [
      0%k1        
      0%k2
      0%mu1
      0%mu2
      ];   % Lower bound
ub = [ 
      20%k1        
      20%k2
      5%mu1
      5%mu2
      ];  % Upper bound
A = []; % No linear inequality constraints
b = []; % No linear inequality constraints
Aeq = []; % No linear equality constraints
beq = []; % No linear equality constraints                                                                                                  
options = optimoptions(@gamultiobj,...  
                     'PlotFcn',{@gaplotpareto,@gaplotscorediversity},...
                     'DistanceMeasureFcn',{@distancecrowding,'genotype'},...%function space (phenotype,default) or design space (genotype). 
                     'ParetoFraction',0.35,... %The Pareto fraction has a default value of 0.35
                     'UseVectorized',true,... %'HybridFcn',@fgoalattain
                     'UseParallel',true,...
                     'FunctionTolerance',1e-3,... %default 1e-3
                     'CrossoverFraction',0.8,...
                     'MaxGenerations',10,...
                     'PopulationSize',1000);   
rng default      % For reproducibility rng, 'twister');     
[x,f,exitFlag,Output] = gamultiobj(FitnessFunction, nvars ,A, b, Aeq, beq, lb, ub, options);

load train; sound(y,Fs)

%  'InitialPopulationMatrix',x0,...
