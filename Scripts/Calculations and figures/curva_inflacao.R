beta1_pre = 0.124439535
beta2_pre = 5.55E-03
beta3_pre = 8.64E-02
beta4_pre = -7.55E-02
lambda1_pre = 2.31761567
lambda2_pre = 1.039329636

beta1_ipca = 5.96E-02
beta2_ipca = -8.89E-03
beta3_ipca = 5.80E-02
beta4_ipca = -4.68E-02
lambda1_ipca = 1.791292504
lambda2_ipca = 1.076407382

resultados <- vector(mode = "numeric")

for(dias in seq(0.5,25,0.5)){

  fator1_pre = (1-exp(-lambda1_pre*dias))/(lambda1_pre*dias)
  fator2_pre = fator1_pre-exp(-lambda1_pre*dias)
  fator3_pre = (1-exp(-lambda2_pre*dias))/(lambda2_pre*dias)-exp(-lambda2_pre*dias)
  
  fator1_ipca = (1-exp(-lambda1_ipca*dias))/(lambda1_ipca*dias)
  fator2_ipca = fator1_ipca-exp(-lambda1_ipca*dias)
  fator3_ipca = (1-exp(-lambda2_ipca*dias))/(lambda2_ipca*dias)-exp(-lambda2_ipca*dias)
  
  r = beta1_pre + beta2_pre*fator1_pre + beta3_pre*fator2_pre+beta4_pre*fator3_pre
  p = beta1_ipca + beta2_ipca*fator1_ipca + beta3_ipca*fator2_ipca+beta4_ipca*fator3_ipca
  inflacao = ((1+r)/(1+p))-1
  print(inflacao)
  
  resultados <- append(resultados, inflacao)
}

x <- seq(from=0.5, to=25, by =0.5)

df_inflacao <- data.frame(cbind(x, resultados))

p1 <- ggplot(df_inflacao, aes(x = x, y = resultados)) +
          geom_line() +
          scale_x_continuous(labels = function(x)x*(252)) +
          scale_y_continuous(labels = function(x)x*100)+
          labs(
            x = "Dias úteis",
            y = "Inflação implícita (% a.a.)"
          )

p1

ggsave("graph5.png", p1, width = 4, height = 3)
