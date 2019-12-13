clear;
n = 1000;
mu1 = 0, sigma1 = 2, mu2 = 15, sigma2 = 3;
p = 0.7;
x1 = normrnd(mu1,sigma1,[1000,n]);
x2 = normrnd(mu2,sigma2,[1000,n]);
x3 = unifrnd(0,1,[1000,n]);
eta = zeros(1000,n);
eta(x3 <= p) = 1;
Z = x1 + eta.* x2;

EZ = mu1 + p * mu2;
DZ = sigma1^2 + p * sigma2^2 + p * (1-p) * mu2^2;

for i = 1 : 1000
    temp = 0;
    for j = 1 : n
        temp = Z(i,j) + temp;
    end
    U(i) = (temp - n * EZ) / sqrt(n * DZ);
end

[counts_U, centers_U] = hist(U, 80);
bar(centers_U, counts_U / sum(counts_U))
