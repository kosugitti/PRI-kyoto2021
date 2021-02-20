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

transformed parameters{
  real alpha;
  real muX;
  real muY;
  alpha = delta * sigma;
  muX = mu + alpha/2;
  muY = mu - alpha/2;
}


model{
  //likelihood
  for(n1 in 1:N1){
    X1[n1] ~ normal(muX, sigma);
  }
  for(n2 in 1:N2){
    X2[n2] ~ normal(muY, sigma);
  }
  //prior
  mu ~ cauchy(0,1);
  delta ~ cauchy(0,1);
  sigma ~ cauchy(0,1);
}

