data{
  int<lower=0> N1;
  int<lower=0> N2;
  real X1[N1];
  real X2[N2];
}

parameters{
  real mu;
  real delta;
  real<lower=0> sigma;
}

model{
  //likelihood
  for(n1 in 1:N1){
    X1[n1] ~ normal(mu, sigma);
  }
  for(n2 in 1:N2){
    X2[n2] ~ normal(mu+delta, sigma);
  }
  //prior
  mu ~ normal(0,100);
  delta ~ normal(0,100);
  sigma ~ cauchy(0,5);
}

generated quantities{
  real predX1;
  real predX2;
  real FLG;
  predX1 = normal_rng(mu,sigma);
  predX2 = normal_rng(mu+delta,sigma);
  if(predX1 > predX2){
    FLG = 1;
  }else{
    FLG=0;
  }
}

