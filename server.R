setwd("C:/My Pandora!!/academic/R/shiny/2012election")
library(googleVis)
library(rmarkdown)
library(shiny)
library(pander)

elect_state=read.csv("US_elect_state.csv",
                     stringsAsFactors=F
)

elect_state$Total_Votes=as.numeric(elect_state$Total_Votes)
elect_state$Vote_Cast_for_Obama=as.numeric(elect_state$Obama)
elect_state$Vote_Cast_for_Romney=as.numeric(elect_state$Romney)
elect_state$Approval_Rating_for_Obama=elect_state$Obama/elect_state$Total_Votes
elect_state$Approval_Rating_for_Romney=elect_state$Romney/elect_state$Total_Votes

elect_state$Winning_Candidate=ifelse(elect_state$Vote_Cast_for_Obama>elect_state$Vote_Cast_for_Romney,1,2)



shinyServer(function(input,output){
  
  output$Overall=renderGvis({
    
    gvisGeoChart(elect_state,
                 locationvar="State", colorvar="Winning_Candidate",
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
                              colorAxis=paste("{colors:['", input$obama_col,"','",input$romney_col,"']}",sep="")
                             )
    )
  })
  
  

### For Obama
   output$Obama=renderGvis({
    
   measur<-switch(input$measurement,
      "popular vote cast"="Vote_Cast_for_Obama",
      "approval rating"="Approval_Rating_for_Obama"
     )
    
  gvisGeoChart(elect_state,
                 locationvar="State", colorvar=paste(measur),
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
                              colorAxis=paste("{colors:['" ,input$obama_col,"']}",sep="")
                  ))
    })
  
  
###For Romney  
  output$Romney=renderGvis({
    
    measur<-switch(input$measurement,
                   "popular vote cast"="Vote_Cast_for_Romney",
                   "approval rating"="Approval_Rating_for_Romney"
    )
    
    gvisGeoChart(elect_state,
                 locationvar="State", colorvar=paste(measur),
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
                              colorAxis=paste("{colors:['" ,input$romney_col,"']}",sep="")
                 ))
  })
  


  
  })