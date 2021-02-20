data {
  int N;              // サンプルサイズ
  vector[N] W;        // 体重データ
}
parameters {
  real muZero;         // 左端
  vector[N] mu;        // 状態の平均値
  real<lower=0> sig;   // 観測誤差の大きさ
  real<lower=0> tau;   // 過程誤差の大きさ
}
model {
  // 状態方程式の部分
  // 左端から初年度の状態を推定する
  mu[1] ~ normal(muZero, tau);  

  // 観測方程式の部分
  for(i in 1:N) {
    W[i] ~ normal(mu[i], sig);
  }

  // 状態の遷移
  for(i in 2:N){
    mu[i] ~ normal(mu[i-1], tau);
  }
  sig ~ cauchy(0,5);
  tau ~ cauchy(0,5);
}

