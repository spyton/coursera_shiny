library(shiny)

data = read.csv("passenger.csv",sep=",")
data =na.omit(data)

shinyUI(fluidPage(titlePanel("Titanic passenger's survival"),
        
  
  sidebarLayout(
    sidebarPanel(
      helpText("This app allow the user use historic information 
               about survived and dead passengers. 
               The main goal is to analyse what sorts of passengers were likely to survive, how sex, age and passenger's class on board influence the probability of survival."),
      hr(),
      
      helpText("You have to choose how many passengers you want to analyse and press the load button to see in graphic."),
       
      sliderInput("npassenger", 
                  label = "number of passenger:",
                  min = 1, max = 714, value = c(1)),

      selectInput("var", 
                  label = "Choose the sex of passenger",
                  choices = list("Male", "Female","All"),
                  selected = "Male"),
      
      hr(),
      actionButton("action", label = "load"),
      fluidRow()
    ),
    
    mainPanel(
      plotOutput('plot')
    )
  )
))