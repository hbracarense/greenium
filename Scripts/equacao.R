library(rootSolve)
library(readxl)

setwd()

#Taxa - OMGN12
f1 = function(x){
  36.66011*((1+x)^(-1))+37.47764934*((1+x)^(-2))+38.23929076*((1+x)^(-3))+38.27772221*((1+x)^(-4))+39.96870592*((1+x)^(-5))+41.47102616*((1+x)^(-6))+43.99003289*((1+x)^(-7))+46.40073281*((1+x)^(-8))+47.27766858*((1+x)^(-9))+49.41721716*((1+x)^(-10))+50.81174166*((1+x)^(-11))+52.50134287*((1+x)^(-12))+53.9056666*((1+x)^(-13))+55.64358587*((1+x)^(-14))+57.11936805*((1+x)^(-15))+58.9589718*((1+x)^(-16))+60.5290014*((1+x)^(-17))+62.48960466*((1+x)^(-18))+64.16374917*((1+x)^(-19))+66.25499304*((1+x)^(-20))+68.03981608*((1+x)^(-21))+70.26920498*((1+x)^(-22))+72.17070725*((1+x)^(-23))+2065.698331*((1+x)^(-23))-1019.739176

}

x = -20:20
plot(x, f1(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f1, c(-20,20))
print(roots)

#Taxa - CEAR25
f2 = function(x){
  30.47263634*((1+x)^(-1))+30.81181941*((1+x)^(-2))+31.49847141*((1+x)^(-3))+32.13858868*((1+x)^(-4))+32.17006795*((1+x)^(-5))+33.59039848*((1+x)^(-6))+34.85527025*((1+x)^(-7))+36.96994691*((1+x)^(-8))+38.99842198*((1+x)^(-9))+39.73548602*((1+x)^(-10))+41.53279997*((1+x)^(-11))+42.70482267*((1+x)^(-12))+722.1135273*((1+x)^(-12))+44.12485114*((1+x)^(-13))+45.30511763*((1+x)^(-14))+45.30511763*((1+x)^(-14))+766.0829914*((1+x)^(-14))-1325.1158
  
}
x = -5:5
plot(x, f2(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f2, c(-5,5))
print(roots)

#Taxa - PALF38
f3 = function(x){
  25.40133363*((1+x)^(-1))+26.06765417*((1+x)^(-2))+26.56353743*((1+x)^(-3))+26.82193391*((1+x)^(-4))+27.44092007*((1+x)^(-5))+27.66284486*((1+x)^(-6))+29.11463155*((1+x)^(-7))+30.49728386*((1+x)^(-8))+32.40438577*((1+x)^(-9))+32.68351103*((1+x)^(-10))+34.60471776*((1+x)^(-11))+35.49469085*((1+x)^(-12))+36.91785799*((1+x)^(-13))+37.68414093*((1+x)^(-14))+39.14502098*((1+x)^(-15))+39.9329319*((1+x)^(-16))+41.47800216*((1+x)^(-17))+42.31200315*((1+x)^(-18))+43.95821203*((1+x)^(-19))+44.8471281*((1+x)^(-20))+1798.271282*((1+x)^(-20))-1281.819181
  
}

x = -1:1
plot(x, f3(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f3, c(-1,1))
print(roots)

#Taxa - TAES14
f4 = function(x){
  46.09577401*((1+x)^(-1))+47.42957675*((1+x)^(-2))+48.9165706*((1+x)^(-3))+53.92874616*((1+x)^(-4))+57.79468028*((1+x)^(-5))+62.76572635*((1+x)^(-6))+66.63735958*((1+x)^(-7))+1511.051238*((1+x)^(-7))-1296.934149
  
}

x = -1:1
plot(x, f4(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f4, c(-1,1))
print(roots)

#Taxa - TIET39
setwd("C:/Users/hbrac/Downloads")
db <- read_xlsx("dados.xlsx")
f5 = function(x){
  48.68978346*((1+x)^(-1))+51.65953264*((1+x)^(-2))+57.49670646*((1+x)^(-3))+61.40086449*((1+x)^(-4))+65.50518374*((1+x)^(-5))+69.45694935*((1+x)^(-6))+73.59647339*((1+x)^(-7))+77.9972326*((1+x)^(-8))+82.6896586*((1+x)^(-9))+87.6928352*((1+x)^(-10))+1860.540072*((1+x)^(-10))-1184.570771
}

x = -1:1
plot(x, f5(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f5, c(-1,1))
print(roots)

#Taxa CMGD27
db <- read_xlsx("dados.xlsx")
f6 = function(x){
    equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
    equation = equation + 1000*((1+x)^(-59))-417.399725
}

x = -1:1
plot(x, f6(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f6, c(-1,1))
print(roots)

#Taxa - CMGD27
db <- read_xlsx("dados.xlsx")
f7 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1573.161337*((1+x)^(-14))-1171.956352
  
}

x = -1:1
plot(x, f7(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f7, c(-1,1))
print(roots)

#Taxa - ELET22
db <- read_xlsx("dados.xlsx")
f8 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1065.409747
  
}

x = -1:1
plot(x, f8(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f8, c(-1,1))
print(roots)

#Taxa - PALF10
db <- read_xlsx("dados.xlsx")
f9 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1059.64256
  
}

x = -1:1
plot(x, f9(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f9, c(-1,1))
print(roots)

#Taxa - TIET19
db <- read_xlsx("dados.xlsx")
f10 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-16))-1004.858942
  
}

x = -1:1
plot(x, f10(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f10, c(-1,1))
print(roots)

#Taxa - CEEBA2
db <- read_xlsx("dados.xlsx")
f11 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 10000*((1+x)^(-10))-9985.941633
  
}

x = -1:1
plot(x, f11(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f11, c(-1,1))
print(roots)

#Taxa - CEMTA1
db <- read_xlsx("dados.xlsx")
f12 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1046.334435
  
}

x = -1:1
plot(x, f12(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f12, c(-1,1))
print(roots)

#Taxa - CEPE10
db <- read_xlsx("dados.xlsx")
f13 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 10000*((1+x)^(-10))-9968.99522
  
}

x = -1:1
plot(x, f13(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f13, c(-1,1))
print(roots)

#Taxa - CEPE20
db <- read_xlsx("dados.xlsx")
f14 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 10000*((1+x)^(-14))-10098.4869
  
}

x = -1:1
plot(x, f14(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f14, c(-1,1))
print(roots)

#Taxa - COCE27
db <- read_xlsx("dados.xlsx")
f15 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1400.21795*((1+x)^(-5))-1253.16348
  
}

x = -1:1
plot(x, f15(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f15, c(-1,1))
print(roots)

#Taxa - CPGT26
db <- read_xlsx("dados.xlsx")
f16 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1486.375*((1+x)^(-12))-1178.024866
  
}

x = -1:1
plot(x, f16(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f16, c(-1,1))
print(roots)

#Taxa - CSRN19
db <- read_xlsx("dados.xlsx")
f17 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1564.579538*((1+x)^(-14))-1167.794328
  
}

x = -1:1
plot(x, f17(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f17, c(-1,1))
print(roots)

#Taxa - CSRN39
db <- read_xlsx("dados.xlsx")
f18 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-977.65
  
}

x = -1:1
plot(x, f18(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f18, c(-1,1))
print(roots)

#Taxa - CTNS15
db <- read_xlsx("dados.xlsx")
f19 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1046.694898
  
}

x = -1:1
plot(x, f19(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f19, c(-1,1))
print(roots)

#Taxa - CTNS25
db <- read_xlsx("dados.xlsx")
f20 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-14))-1038.387917
  
}

x = -1:1
plot(x, f20(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f20, c(-1,1))
print(roots)

#Taxa - EBENA0
db <- read_xlsx("dados.xlsx")
f21 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1010.865026
  
}

x = -1:1
plot(x, f21(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f21, c(-1,1))
print(roots)

#Taxa - EGIE49
db <- read_xlsx("dados.xlsx")
f22 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1895.715283*((1+x)^(-17))-1106.545011
  
}

x = -1:1
plot(x, f22(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f22, c(-1,1))
print(roots)

#Taxa - ESCE18
db <- read_xlsx("dados.xlsx")
f23 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1010.025058
  
}

x = -1:1
plot(x, f23(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f23, c(-1,1))
print(roots)

#Taxa - ESULA2
db <- read_xlsx("dados.xlsx")
f24 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1046.212402
  
}

x = -1:1
plot(x, f24(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f24, c(-1,1))
print(roots)

#Taxa - MSGT12
db <- read_xlsx("dados.xlsx")
f25 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2029.82*((1+x)^(-22))-1072.760725
  
}

x = -1:1
plot(x, f25(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f25, c(-1,1))
print(roots)

#Taxa - OMGE11
db <- read_xlsx("dados.xlsx")
f26 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1065.358145
  
}

x = -1:1
plot(x, f26(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f26, c(-1,1))
print(roots)

#Taxa - OMGE21
db <- read_xlsx("dados.xlsx")
f27 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-14))-1057.108258
  
}

x = -1:1
plot(x, f27(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f27, c(-1,1))
print(roots)

#Taxa - OMGE31
db <- read_xlsx("dados.xlsx")
f28 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1570.177826*((1+x)^(-7))-1219.817263
  
}

x = -1:1
plot(x, f28(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f28, c(-1,1))
print(roots)

#Taxa - PPTE11
db <- read_xlsx("dados.xlsx")
f30 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1861.465627*((1+x)^(-18))-1092.055846

  
}

x = -1:1
plot(x, f30(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f30, c(-1,1))
print(roots)

#Taxa - TAEE26
db <- read_xlsx("dados.xlsx")
f31 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 4592.630222*((1+x)^(-50))-1145.505612
  
  
}

x = -1:1
plot(x, f31(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f31, c(-1,1))
print(roots)

#Taxa - ETSP12
db <- read_xlsx("dados.xlsx")
f32 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 3386.222004*((1+x)^(-37))-1059.188076

  
}

x = -1:1
plot(x, f32(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f32, c(-1,1))
print(roots)

#Taxa - TBEG11
db <- read_xlsx("dados.xlsx")
f33 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2682.436787*((1+x)^(-31))-1067.48655
  
  
}

x = -1:1
plot(x, f33(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f33, c(-1,1))
print(roots)

#Taxa - VDBF12
db <- read_xlsx("dados.xlsx")
f34 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2360.590397*((1+x)^(-28))-1024.345905

  
}

x = -1:1
plot(x, f34(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f34, c(-1,1))
print(roots)

#Taxa - NEOE16
db <- read_xlsx("dados.xlsx")
f35 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1874.944441*((1+x)^(-10))-1111.907883
  
  
}

x = -1:1
plot(x, f35(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f35, c(-1,1))
print(roots)

#Taxa - CPGT16
db <- read_xlsx("dados.xlsx")
f36 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1045.11
  
  
}

x = -1:1
plot(x, f36(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f36, c(-1,1))
print(roots)

#Taxa - CPRE29
db <- read_xlsx("dados.xlsx")
f37 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 10000*((1+x)^(-9))-10646.258518

  
  
}

x = -1:1
plot(x, f37(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f37, c(-1,1))
print(roots)

#Taxa - EGIE19
db <- read_xlsx("dados.xlsx")
f38 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1574.931961*((1+x)^(-6))-1161.296024
  
  
}

x = -1:1
plot(x, f38(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f38, c(-1,1))
print(roots)

#Taxa - EGIE29
db <- read_xlsx("dados.xlsx")
f38 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1877.151899*((1+x)^(-9))-1107.108782
  
  
}

x = -1:1
plot(x, f38(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f38, c(-1,1))
print(roots)

#Taxa - ELET32
db <- read_xlsx("dados.xlsx")
f39 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-14))-1065.26444
  
  
}

x = -1:1
plot(x, f39(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f39, c(-1,1))
print(roots)

#Taxa - ELET42
db <- read_xlsx("dados.xlsx")
f40 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1871.282948*((1+x)^(-20))-1191.982907
  
  
}

x = -1:1
plot(x, f40(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f40, c(-1,1))
print(roots)

#Taxa - ELPLB4
db <- read_xlsx("dados.xlsx")
f41 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1568.139245*((1+x)^(-14))-1174.803589
  
  
}

x = -1:1
plot(x, f41(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f41, c(-1,1))
print(roots)

#Taxa - ENGIA1
db <- read_xlsx("dados.xlsx")
f42 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1564.579538*((1+x)^(-7))-1207.612293
  
  
}

x = -1:1
plot(x, f42(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f42, c(-1,1))
print(roots)

#Taxa - LIGHB6
db <- read_xlsx("dados.xlsx")
f43 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1000.220661
  
  
}

x = -1:1
plot(x, f43(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f43, c(-1,1))
print(roots)

#Taxa - MGSP12
db <- read_xlsx("dados.xlsx")
f44 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 3409.921508*((1+x)^(-36))-1150.946044
  
  
}

x = -1:1
plot(x, f44(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f44, c(-1,1))
print(roots)

#Taxa - NEOE26
db <- read_xlsx("dados.xlsx")
f45 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2377.590202*((1+x)^(-14))-1123.948477
  
  
}

x = -1:1
plot(x, f45(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f45, c(-1,1))
print(roots)

#Taxa - TAEE26
db <- read_xlsx("dados.xlsx")
f46 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-14))-1056.582295
  
  
}

x = -1:1
plot(x, f46(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f46, c(-1,1))
print(roots)

#Taxa - TAEE17
db <- read_xlsx("dados.xlsx")
f47 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 4615.762442*((1+x)^(-40))-1138.742916
  
  
}

x = -1:1
plot(x, f47(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f47, c(-1,1))
print(roots)

#Taxa - TIET29
db <- read_xlsx("dados.xlsx")
f48 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1860.540072*((1+x)^(-20))-1148.200078
  
  
}

x = -1:1
plot(x, f48(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f48, c(-1,1))
print(roots)

#Taxa - CEEBB2
db <- read_xlsx("dados.xlsx")
f49 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 10000*((1+x)^(-14))-10040.64174
  
  
}

x = -1:1
plot(x, f49(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f49, c(-1,1))
print(roots)

#Taxa - COCE17
db <- read_xlsx("dados.xlsx")
f50 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-8))-508.167083
  
  
}

x = -1:1
plot(x, f50(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f50, c(-1,1))
print(roots)

#Taxa - CRSN39
db <- read_xlsx("dados.xlsx")
f51 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-978.0826
  
  
}

x = -1:1
plot(x, f51(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f51, c(-1,1))
print(roots)

#Taxa - CUTI11
db <- read_xlsx("dados.xlsx")
f52 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2183.439616*((1+x)^(-26))-1035.117552
  
  
}

x = -1:1
plot(x, f52(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f52, c(-1,1))
print(roots)

#Taxa - EGIE39
db <- read_xlsx("dados.xlsx")
f53 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1574.931961*((1+x)^(-11))-1155.619677
  
  
}

x = -1:1
plot(x, f53(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f53, c(-1,1))
print(roots)

#Taxa - TAEE18
db <- read_xlsx("dados.xlsx")
f54 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 4635.028364*((1+x)^(-48))-1101.319135
  
  
}

x = -1:1
plot(x, f54(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f54, c(-1,1))
print(roots)

#Taxa - CPLD25
db <- read_xlsx("dados.xlsx")
f55 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-6))-534.040505
  
  
}

x = -1:1
plot(x, f55(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f55, c(-1,1))
print(roots)

#Taxa - CTEE18
db <- read_xlsx("dados.xlsx")
f56 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-20))-1069.870872
  
  
}

x = -1:1
plot(x, f56(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f56, c(-1,1))
print(roots)

#Taxa - EGVG21
db <- read_xlsx("dados.xlsx")
f57 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1880.531083*((1+x)^(-10))-788.187158
  
  
}

x = -1:1
plot(x, f57(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f57, c(-1,1))
print(roots)

#Taxa - ENEV16
db <- read_xlsx("dados.xlsx")
f58 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1946.520782*((1+x)^(-20))-1041.372631
  
  
}

x = -1:1
plot(x, f58(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f58, c(-1,1))
print(roots)

#Taxa - ENGIB4
db <- read_xlsx("dados.xlsx")
f59 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1935.773578*((1+x)^(-20))-1055.969417
  
  
}

x = -1:1
plot(x, f59(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f59, c(-1,1))
print(roots)

#Taxa - ENMTA2
db <- read_xlsx("dados.xlsx")
f60 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1045.509539
  
  
}

x = -1:1
plot(x, f60(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f60, c(-1,1))
print(roots)

#Taxa - LIGHA9
db <- read_xlsx("dados.xlsx")
f61 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1458.109825*((1+x)^(-5))-1204.827719
  
  
}

x = -1:1
plot(x, f61(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f61, c(-1,1))
print(roots)

#Taxa - LTTE15
db <- read_xlsx("dados.xlsx")
f62 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 3095.790324*((1+x)^(-17))-1052.925322
  
  
}

x = -1:1
plot(x, f62(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f62, c(-1,1))
print(roots)

#Taxa - UTPS21
db <- read_xlsx("dados.xlsx")
f63 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2787.063165*((1+x)^(-31))-1237.239851
  
  
}

x = -1:1
plot(x, f63(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f63, c(-1,1))
print(roots)

#Taxa - UTPS22
db <- read_xlsx("dados.xlsx")
f64 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2745.726148*((1+x)^(-31))-1076.131971
  
  
}

x = -1:1
plot(x, f64(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f64, c(-1,1))
print(roots)

#Taxa - OMGE13
db <- read_xlsx("dados.xlsx")
f65 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-16))-981.866758
  
  
}

x = -1:1
plot(x, f65(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f65, c(-1,1))
print(roots)

#Taxa - CLCD14
db <- read_xlsx("dados.xlsx")
f66 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-20))-995.28901
  
  
}

x = -1:1
plot(x, f66(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f66, c(-1,1))
print(roots)

#Taxa - ELET13
db <- read_xlsx("dados.xlsx")
f67 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1022.494729
  
  
}

x = -1:1
plot(x, f67(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f67, c(-1,1))
print(roots)

#Taxa - ELET23
db <- read_xlsx("dados.xlsx")
f68 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1919.732821*((1+x)^(-20))-1013.313445
  
  
}

x = -1:1
plot(x, f68(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f68, c(-1,1))
print(roots)

#Taxa - ELPLA5
db <- read_xlsx("dados.xlsx")
f69 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1925.683992*((1+x)^(-20))-981.563284
  
  
}

x = -1:1
plot(x, f69(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f69, c(-1,1))
print(roots)

#Taxa - EQUA11
db <- read_xlsx("dados.xlsx")
f70 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 3063.304649*((1+x)^(-30))-1024.826498
  
  
}

x = -1:1
plot(x, f70(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f70, c(-1,1))
print(roots)

#Taxa - LIGHD2
db <- read_xlsx("dados.xlsx")
f71 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1903.9302*((1+x)^(-20))-994.944974
  
  
}

x = -1:1
plot(x, f71(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f71, c(-1,1))
print(roots)

#Taxa - MANT12
db <- read_xlsx("dados.xlsx")
f72 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 10000*((1+x)^(-20))-9477.554614
  
  
}

x = -1:1
plot(x, f72(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f72, c(-1,1))
print(roots)

#Taxa - RIPR22
db <- read_xlsx("dados.xlsx")
f73 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1934.127484*((1+x)^(-20))-996.381049
  
  
}

x = -1:1
plot(x, f73(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f73, c(-1,1))
print(roots)

#Taxa - TAEEA1
db <- read_xlsx("dados.xlsx")
f74 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-14))-1084.853574
  
  
}

x = -1:1
plot(x, f74(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f74, c(-1,1))
print(roots)

#Taxa - XNGU17
db <- read_xlsx("dados.xlsx")
f75 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2343.086044*((1+x)^(-27))-1014.240481
  
  
}

x = -1:1
plot(x, f75(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f75, c(-1,1))
print(roots)

#Taxa - RSSAN34
db <- read_xlsx("dados.xlsx")
f76 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1604.381803*((1+x)^(-14))-1062.493218
  
  
}

x = -1:1
plot(x, f76(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f76, c(-1,1))
print(roots)

#Taxa - RSSAN24
db <- read_xlsx("dados.xlsx")
f77 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1042.366973
  
  
}

x = -1:1
plot(x, f77(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f77, c(-1,1))
print(roots)

#Taxa - SAPRA1
db <- read_xlsx("dados.xlsx")
f78 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1025.92281
  
  
}

x = -1:1
plot(x, f78(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f78, c(-1,1))
print(roots)

#Taxa - SAPRA3
db <- read_xlsx("dados.xlsx")
f79 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1928.360632*((1+x)^(-20))-990.312283
  
  
}

x = -1:1
plot(x, f79(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f79, c(-1,1))
print(roots)

#Taxa - RSAN44
db <- read_xlsx("dados.xlsx")
f80 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1914.855682*((1+x)^(-20))-1053.501411
  
  
}

x = -1:1
plot(x, f80(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f80, c(-1,1))
print(roots)

#Taxa - AEGP17
db <- read_xlsx("dados.xlsx")
f81 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-12))-1012.493158
  
  
}

x = -1:1
plot(x, f81(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f81, c(-1,1))
print(roots)

#Taxa - CAEC11
db <- read_xlsx("dados.xlsx")
f82 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1032.450906
  
  
}

x = -1:1
plot(x, f82(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f82, c(-1,1))
print(roots)

#Taxa - CSMGA5
db <- read_xlsx("dados.xlsx")
f83 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-20))-1024.737887
  
  
}

x = -1:1
plot(x, f83(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f83, c(-1,1))
print(roots)

#Taxa - GSTS13
db <- read_xlsx("dados.xlsx")
f84 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1022.583765

  
}

x = -1:1
plot(x, f84(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f84, c(-1,1))
print(roots)

#Taxa - SAPRA2
db <- read_xlsx("dados.xlsx")
f85 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1713.301961*((1+x)^(-16))-1011.832808
  
  
}

x = -1:1
plot(x, f85(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f85, c(-1,1))
print(roots)

#Taxa - SBSPB7
db <- read_xlsx("dados.xlsx")
f86 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1071.562659
  
  
}

x = -1:1
plot(x, f86(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f86, c(-1,1))
print(roots)

#Taxa - SBSPA7
db <- read_xlsx("dados.xlsx")
f87 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-6))-1063.136819
  
  
}

x = -1:1
plot(x, f87(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f87, c(-1,1))
print(roots)

#Taxa - SBSPC7
db <- read_xlsx("dados.xlsx")
f88 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-16))-1087.698202
  
  
}

x = -1:1
plot(x, f88(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f88, c(-1,1))
print(roots)

#Taxa - SNG018
db <- read_xlsx("dados.xlsx")
f89 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-60))-1017.807391
  
  
}

x = -1:1
plot(x, f89(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f89, c(-1,1))
print(roots)

#Taxa - ESBG11
db <- read_xlsx("dados.xlsx")
f90 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1817.454649*((1+x)^(-18))-1000
  
  
}

x = -1:1
plot(x, f90(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f90, c(-1,1))
print(roots)

#Taxa - EATE19
db <- read_xlsx("dados.xlsx")
f91 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1016.646639
  
  
}

x = -1:1
plot(x, f91(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f91, c(-1,1))
print(roots)

#Taxa - PTAZ11
db <- read_xlsx("dados.xlsx")
f92 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 4736.670538*((1+x)^(-47))-1044.824678
  
  
}

x = -1:1
plot(x, f92(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f92, c(-1,1))
print(roots)

#Taxa - TAEEA2
db <- read_xlsx("dados.xlsx")
f93 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2596.748062*((1+x)^(-30))-981.854819
  
  
}

x = -1:1
plot(x, f93(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f93, c(-1,1))
print(roots)

#Taxa - TPNO13
db <- read_xlsx("dados.xlsx")
f94 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2993.837755*((1+x)^(-35))-967.81301
  
  
}

x = -1:1
plot(x, f94(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f94, c(-1,1))
print(roots)

#Taxa - GASC12
db <- read_xlsx("dados.xlsx")
f95 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-12))-1000
  
  
}

x = -1:1
plot(x, f95(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f95, c(-1,1))
print(roots)

#Taxa - CCROA5
db <- read_xlsx("dados.xlsx")
f96 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 2188.725976*((1+x)^(-25))-985.249724
  
  
}

x = -1:1
plot(x, f96(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f96, c(-1,1))
print(roots)

#Taxa - CRMG15
db <- read_xlsx("dados.xlsx")
f97 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1856.092514*((1+x)^(-19))-1077.175946
  
  
}

x = -1:1
plot(x, f97(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f97, c(-1,1))
print(roots)

#Taxa - GASC22
db <- read_xlsx("dados.xlsx")
f98 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1939.28922*((1+x)^(-20))-1041.456029
  
  
}

x = -1:1
plot(x, f98(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f98, c(-1,1))
print(roots)

#Taxa - IVIA18
db <- read_xlsx("dados.xlsx")
f99 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1079.610426
  
  
}

x = -1:1
plot(x, f99(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f99, c(-1,1))
print(roots)

#Taxa - RUMOA6
db <- read_xlsx("dados.xlsx")
f100 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1907.273186*((1+x)^(-20))-1003.705911
  
  
}

x = -1:1
plot(x, f100(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f100, c(-1,1))
print(roots)

#Taxa - VIAL19
db <- read_xlsx("dados.xlsx")
f101 = function(x){
  equation = 0
  for(i in 1:nrow(db)){
    equation = db$Rates[i]*((1+x))^(-i) + equation
  }
  equation = equation + 1000*((1+x)^(-10))-1020.05317
  
  
}

x = -1:1
plot(x, f101(x), type = 'l')
abline(h = 0, col = 'blue')

roots = uniroot.all(f101, c(-1,1))
print(roots)