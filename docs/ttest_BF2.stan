data{
  int<lower=0> N1;
  int<lower=0> N2;
  real X1[N1];
  real X2[N2];
}

parameters{
  real mu1;
  real mu2;
  real<lower=0> sigma;
}

model{
  //likelihood
  for(n1 in 1:N1){
    target += normal_lpdf(X1[n1]|mu1, sigma);
  }
  for(n2 in 1:N2){
    target += normal_lpdf(X2[n2]|mu2, sigma);
  }
  //prior
  target += normal_lpdf(mu1|0,100);
  target += normal_lpdf(mu2|0,100);
  target += cauchy_lpdf(sigma|0,5) - cauchy_lccdf(0|0,5);;
}
