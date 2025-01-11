rm(list = ls())

install.packages("readcsv")
install.packages("rugarch")
install.packages("FinTS")
install.packages("forecast")

library(readcsv)
library(rugarch)
library(FinTS)
library(forecast)

data <- read.csv(/Users/lu/Desktop/USB US Equity.csv)

ts_data <- ts(data$   , frequency = 1)

lm_model <- lm(ts_data - 1)

residuals <- residuals(lm_model)

arch_test_result <- ArchTest(residuals)
print(arch_test_result)

forecast::auto.arima(ts_data)
fit = arima(ts_data.order=c(1,0,1))
fit
et = fit$residuals
tsdiag(fit)
Box.test(et^2, lag = 1, type = "Ljun-Box")
Box.test(et^2, lag = 5, type = "Ljun-Box")
Box.test(et^2, lag = 10, type = "Ljun-Box")

# GARCH
spec1 <- ugarchspec()
fit1 <- ugarchfit(spec1, data = ts_data)

spec2 <- ugarchspec(mean.model = list(armaOrder = c(2,2), fixed.pars = list(ar1 = 0)))
fit2 <- ugarchfit(spec2, data = ts_data)

spec3 <- ugarchspec(variance.model = list(model = "eGARCH", garchOrder = c(1, 1)),
                    mean.model = list(armaOrder = c(0,1), include.mean = TRUE),
                    distribution.model = "norm", fixed.pars = list(omega = 0))
fit3 <- ugarchfit(spec3, data = ts_data)

print(fit1)
print(fit2)
print(fit3)