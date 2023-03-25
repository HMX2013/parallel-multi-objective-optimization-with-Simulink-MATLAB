
numSims  = numel(x(:,1));
n=1:1:numSims;

figure(1);
subplot(221);
scatter(n,x(:,1),'pentagram','r');
xlabel('n');ylabel('k1');
subplot(222);
scatter(n,x(:,2),'pentagram','r');
xlabel('n');ylabel('k2');
subplot(223);
scatter(n,x(:,3),'pentagram','r');
xlabel('n');ylabel('mu1');
subplot(224);
scatter(n,x(:,4),'pentagram','r');
xlabel('n');ylabel('mu2');


