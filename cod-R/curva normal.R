x=seq(180,220,length=200)

y1=dnorm(x,mean=205,sd=1.3)
plot(x,y1,type="n",lwd=2,col="red")
lines(x,y1, col = "red") 

y2=dnorm(x,mean=206,sd=2.6)
lines(x,y2, col = "black")

y2=dnorm(x,mean=203,sd=5.6)
lines(x,y2, col = "blue")

y2=dnorm(x,mean=201,sd=3.4)
lines(x,y2, col = "orange")

y2=dnorm(x,mean=202,sd=4)
lines(x,y2, col = "green")

