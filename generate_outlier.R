library(mvtnorm)
df <- n01 |>
  transmute(
    V1 = v1,
    V2 = v1 + v2,
    V3 = v1 + v2 + v3
  )
Sigma <- matrix(c(1,1,1,1,2,2,1,2,3), nrow = 3)

# Find lower limits on univariate and bivariate scores
min1 <- quantile(dnorm(df$V1, sd = Sigma[1,1], log = TRUE), prob = 0.01)
min2 <- quantile(dnorm(df$V2, sd = Sigma[2,2], log = TRUE), prob = 0.01)
min3 <- quantile(dnorm(df$V3, sd = Sigma[3,3], log = TRUE), prob = 0.01)
min12 <- quantile(dmvnorm(df[,1:2], sigma = Sigma[1:2,1:2], log = TRUE), prob = 0.01)
min13 <- quantile(dmvnorm(df[,c(1,3)], sigma = Sigma[c(1,3),c(1,3)], log = TRUE), prob = 0.01)
min23 <- quantile(dmvnorm(df[,2:3], sigma = Sigma[2:3,2:3], log = TRUE), prob = 0.01)

# Find outlier in 2d space that is not an outlier in any 1d space

outlier_score <- function(x) {
  if(any(x < -8) || any(x > 8)) return(Inf)
  score12 <- dmvnorm(x[1:2], sigma = Sigma[1:2,1:2], log = TRUE)
  score23 <- dmvnorm(x[2:3], sigma = Sigma[2:3,2:3], log = TRUE) < min23
  score13 <- dmvnorm(x[c(1,3)], sigma = Sigma[c(1,3),c(1,3)], log = TRUE) < min13
  score1 <- dnorm(x[1], sd = Sigma[1,1], log = TRUE) < min1
  score2 <- dnorm(x[2], sd = Sigma[2,2], log = TRUE) < min2
  score3 <- dnorm(x[3], sd = Sigma[3,3], log = TRUE) < min3
  return(score12 + 1000 * (score1 + score2 + score3 + score23 + score13))
}
best <- optim(c(-1, 2, 2), outlier_score)
best

# Find outlier in 3d space that is not an outlier in any 2d space
# Find lower limits on bivariate scores

outlier_score <- function(x) {
  if(any(x < -8) || any(x > 8)) return(Inf)
  score123 <- dmvnorm(x, sigma = Sigma, log = TRUE)
  score12 <- dmvnorm(x[1:2], sigma = Sigma[1:2,1:2], log = TRUE) < min12
  score23 <- dmvnorm(x[2:3], sigma = Sigma[2:3,2:3], log = TRUE) < min23
  score13 <- dmvnorm(x[c(1,3)], sigma = Sigma[c(1,3),c(1,3)], log = TRUE) < min13
  return(score123 + 1000 * (score12 + score23 + score13))
}

best <- optim(c(0,0,0), outlier_score)
best

