clear;
n = 10000;
mu1 = Input_mu1, sigma1 = Input_sigma1;
mu2 = Input_mu2, sigma2 = Input_sigma2;
p = Input_p;
x1 = normrnd(mu1,sigma1,[n,1]);
x2 = normrnd(mu2,sigma2,[n,1]);
x3 = unifrnd(0,1,[n,1]);
eta = zeros(n,1);
[counts_x1, centers_x1] = hist(x1, 100);
[counts_x2, centers_x2] = hist(x2, 100);
% bar(centers_x1, counts_x1 / sum(counts_x1));
% bar(centers_x2, counts_x1 / sum(counts_x1));
eta(x3 <= p) = 1;
Z = x1 + eta.* x2;
[counts_Z, centers_Z] = hist(Z, 80);
bar(centers_Z, counts_Z / sum(counts_Z))