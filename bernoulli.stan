data{
  int N;
  int Y[N];
}

parameters{
  real<lower=0,upper=1> theta;
}

model{
  for(n in 1:N){
    Y[n] ~ bernoulli(theta);
  }
}
