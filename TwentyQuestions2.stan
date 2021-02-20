data{
  int<lower=0> L; // data length
  int<lower=0> N; // number of persons
  int<lower=0> M; // number of questions
  int<lower=0> Pid[L];  // personal ID
  int<lower=0> Qid[L];  // question ID
  int<lower=0> resp[L]; // response
}

parameters{
  real p[N];
  real q[M];
}

model{
  for(l in 1:L){
    resp[l] ~ bernoulli_logit(p[Pid[l]]-q[Qid[l]]);
  }
  p ~ normal(0,1);
  q ~ normal(0,5);
}
