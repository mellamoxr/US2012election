library(rCharts)
library(shiny)
shinyUI(fluidPage(
  
  titlePanel("An Overview of 2012 US Presidental Election by Popular Vote"),
  
  sidebarLayout(
    
     sidebarPanel(
       selectInput("obama_col",
                   label=strong("Select a color for Oabama"),
                   choices=list("red","blue","green","orange","yellow","purple"),
                   selected="blue"),
       
       selectInput("romney_col",
                  label=strong("Select a color for Romney"),
                  choices=list("red","blue","green","orange","yellow","purple"),
                  selected="red"),
       
       selectInput("measurement",
                   label=strong("View election results by"),
                   choices=list("popular vote cast",
                                "approval rating"),
                   selected="percentage of approval")
       
       ),
     
     mainPanel(
        
       tabsetPanel(position="above",
           tabPanel("Documentation",includeMarkdown("documentation.md")),
           tabPanel("Who Wins Which State?",htmlOutput("Overall")),        
           tabPanel("Overview for Obama",htmlOutput("Obama")),
           tabPanel("Overview for Romney",htmlOutput("Romney"))
        ))
    )
  
))