library(readxl)
library(tidyverse)

setwd()
green_value <- read_xlsx('Pasta1.xlsx', sheet = 'Planilha3')
green_emissions <- read_xlsx('Pasta1.xlsx', sheet = 'Planilha2')

cores = c("Green" = "#6AB187", "Transition"="#D32D41", "Sustainable"="#B3C100", "Social" = "#4CB5F5", "Performance" = "#1F3F49")

escala <- max(green_emissions$Green) / max(green_value$value_r)

ggplot() + 
  geom_bar(green_value, mapping = aes(fill = category, x=year, y=value_r*escala),position="dodge", stat="identity")+
  geom_line(green_emissions, mapping = aes(x = Year,y=Green), color = "#6AB187")+
  geom_point(green_emissions, mapping = aes(x = Year,y=Green), color = "#6AB187")+
  geom_line(green_emissions, mapping = aes(x = Year,y=Transition), color = "#D32D41")+
  geom_point(green_emissions, mapping = aes(x = Year,y=Transition), color = "#D32D41")+
  geom_line(green_emissions, mapping = aes(x = Year,y=Sustainable), color = "#B3C100")+
  geom_point(green_emissions, mapping = aes(x = Year,y=Sustainable), color = "#B3C100")+
  geom_line(green_emissions, mapping = aes(x = Year,y=Social), color = "#4CB5F5")+
  geom_point(green_emissions, mapping = aes(x = Year,y=Social), color = "#4CB5F5")+
  geom_line(green_emissions, mapping = aes(x = Year,y=Performance), color = "#1F3F49")+
  geom_point(green_emissions, mapping = aes(x = Year,y=Performance), color = "#1F3F49")+
  scale_fill_manual(values=cores)+
  scale_x_continuous('Year', breaks = 2015:2021) +
  scale_y_continuous(name = "Emissions", sec.axis = sec_axis(~./escala, name = "Volume (2015 US$ bi)"))+
  labs(fill = "Category")+
  theme(legend.position = "bottom", legend.direction = "horizontal")

ggsave('figure1.jpeg', width = 10, height = 5, device='jpeg', dpi=300)

green_instru <- read_xlsx('Pasta1.xlsx', sheet = 'Planilha5')
green_instru_total <- read_xlsx('Pasta1.xlsx', sheet = 'Planilha6')

cores = c("Bonds" = "#6AB187", "Agribusiness Credit Receivable Certificates (CRA)"="#D32D41", "Real Estate Receivables Certificates (CRI)"="#B3C100", "Debentures" = "#4CB5F5", "Infrastructure Debentures" = "#1F3F49", "Loans" = "#488A99", "Credit Receivables Investment Funds (FIDC)" = "#DADADA", "Global Notes" = "#A5D8DD", "Financial Letters" = "#EA6A47")
ggplot() +
  geom_bar(green_instru, mapping = aes(fill = as.factor(type), x=year, y=volume_r),position="stack", stat="identity")+
  geom_line(green_instru_total, mapping = aes(x = year,y=total_r), color = "#202020")+
  geom_point(green_instru_total, mapping = aes(x = year,y=total_r), color = "#202020")+
  geom_text(green_instru_total, mapping = aes(x = year,y=total_r), label = round(green_instru_total$total_r, 2), nudge_y = 0.5, size=3)+
  scale_fill_manual(values=cores)+
  scale_x_continuous('Year', breaks = 2015:2021)+
  ylab("Volume (2015 US$ bi)")+
  labs(fill = "Type")
ggsave('figure2.jpeg', width = 10, height = 5, device='jpeg', dpi=300)

green_type <- read_xlsx('Pasta1.xlsx', sheet = 'Planilha7')
cores = c("Non-financial corporate" = "#6AB187", "State-owned enterprise"="#D32D41", "Financial corporate"="#B3C100")
ggplot() +
  geom_bar(green_type, mapping = aes(fill = as.factor(type), x=year, y=volume_r),position="fill", stat="identity")+
  scale_fill_manual(values=cores)+
  scale_y_continuous(name = "Percentage of volume (%, 2015 US$ bi)", labels = function(x) x * 100)+
  scale_x_continuous('Year', breaks = 2015:2021)+
  labs(fill = "Issuer type")+
  theme(legend.position = "bottom", legend.direction = "horizontal")
ggsave('figure3.jpeg', width = 7, height = 5, device='jpeg', dpi=300)

green_sector <- read_xlsx('Pasta1.xlsx', sheet = 'Planilha8')
cores = c("Agricultural" = "#6AB187", "Energy storage"="#D32D41", "Bioenergy"="#B3C100", "Performance" = "#4CB5F5", "Eco-efficiency" = "#1F3F49", "Energy efficiency" = "#488A99", "Renewable energy" = "#DADADA", "Forests" = "#A5D8DD", "Popular housing" = "#EA6A47", "Micro, small and medium enterprises" = "#202020", "Multiples" = "#0091D5", "Energy transmission" = "#7E909A", "Transportation"="#1C4E80")
ggplot() +
  geom_bar(green_sector, mapping = aes(fill = as.factor(type), x=year, y=volume_r),position="fill", stat="identity")+
  scale_fill_manual(values=cores)+
  scale_y_continuous(name = "Percentage of volume (%, 2015 US$ bi)", labels = function(x) x * 100)+
  scale_x_continuous('Year', breaks = 2015:2021)+
  labs(fill = "Sector")+
  theme(legend.position = "bottom", legend.direction = "horizontal")

ggsave('figure4.jpeg', width = 9, height = 5, device='jpeg', dpi=300)

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
    x = "Business days",
    y = "Implicit inflation (% year)"
  )

p1

ggsave("figure5.jpeg", p1, width = 4, height = 3, device='jpeg', dpi=300)