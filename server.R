library(shiny)

# server.R

data = read.csv("passenger.csv",sep=",")
data =na.omit(data)


shinyServer(function(input, output,session) {
  
  
  output$plot <- reactivePlot(function() {
    
      input$action
     
      isolate({

      data=data[1:input$npassenger,]
      Plot_Data = switch(input$var, 
                       "Male" = subset(data,Sex=="male"),
                       "Female" = subset(data,Sex=="female"),
                       "All" = data)
      red=Plot_Data$Survived
      plot(Plot_Data$Age,Plot_Data$Pclass,pch=20,col=rgb(r=red,g=0,b=1-red), main = "Survived (red) and dead (blue) passengers", ylab = "Passenger's class on board", 
           xlab = "Age of passenger")
      grid()
    })
      
    
  }, height=400)
  
  
}) 
