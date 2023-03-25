%choose the optimum point on the pareto front, design variable 
num   = numel(f(:,1));
for i=1:num
    if abs(f(i,1)-0.1033)<0.0001
        best=i;
    end
end
vpa(f(best,:),7) 
xx=double(vpa(x(best,:),7))




