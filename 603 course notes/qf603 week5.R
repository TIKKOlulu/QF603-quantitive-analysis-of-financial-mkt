library(fpp2)
autoplot(elec)
autoplot(decompose(elec))
acf(elec)
pacf(elec)
tsdisplay(elec)
autoplot(elec/monthdays(elec))
?elec
?ausgdp
autoplot(elec)
elec



autoplot(BoxCox(elec, 0.2))
autoplot(BoxCox(elec, 0.1))
autoplot(BoxCox(elec, 0.5))
autoplot(BoxCox(elec, BoxCox.lambda(elec)))
BoxCox.lambda(elec)
acf(elec)
acf(diff(elec))

