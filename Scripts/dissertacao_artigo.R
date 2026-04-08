library(readxl)
library(tidyverse)

#Abre o diretório
setwd()

#Gráfico OMNG12
omng12 <- read_excel("duration_db.xlsx", sheet = "OMNG12")

df <- omng12 %>% filter(asset != "OMNG12")
gb <- omng12 %>% filter(asset == "OMNG12")

gb$asset <- "Green bond"

for(i in 1:nrow(df)){
  ifelse(df$rating[i] != "-", df$asset[i] <- "Rated vanilla bond",
         df$asset[i] <- "Vanilla bond")
}

p <- ggplot(omng12, mapping = aes(x = modified_duration, y = current_yield))+
  geom_point(color = 
               ifelse(omng12$asset == "Green bond", "green",
                      ifelse(omng12$asset == "Vanilla bond", "blue",
                             "orange")),
             show.legend = TRUE) +
  stat_smooth(data = subset(omng12, asset != "Green bond"), 
              aes(x = modified_duration, y = current_yield),
              method = "lm", se=TRUE, fill = NA, 
              formula =y ~ poly(x, 2, raw=TRUE), color = "red") +
  labs(
    x = "Modified duration",
    y = "Annual percentage yield"
  )+
  theme(legend.position = "top")

ggsave("figure6.jpeg", p, width = 4, height = 3, device='jpeg', dpi=300)