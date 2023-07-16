#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(rAmCharts)
library(stringr)
library(colourpicker)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  

  
  filtered_data = reactive({
    filter(HM_Sales,Category == input$cate)
  })
  
  output$graph <- renderPlot({
    
  input$goButton
    
  if (input$type == "by Month") {  
    
    ggplot(filtered_data())+
      aes(x=as.Date(Date),
          y=filtered_data()$"Sales",col="Tendance")+
      xlab("Date")+ylab("Amount")+
      geom_line(col="green",size=2)+
      ggtitle("Total Sales by Month")+
      geom_smooth(col="yellow")+
      theme_minimal()+scale_fill_brewer(palette="BuGn")+ 
      theme(plot.title = element_text(size=22))+
      scale_x_date(limits = c(input$Time[1], input$Time[2]), date_labels = "%Y-%m-%d")
  
  } else if (input$type == "by Sub-category") {

    ggplot(filtered_data(), aes(x=SubCategory,y=Sales,fill=SubCategory))+
      geom_col()+
      scale_x_discrete(labels = function(x) str_wrap(x, width = 10))+
      labs(title = "Total Sales by Sub-Category",
           x = "Sub-Category",
           y = "Amount")+
      theme_classic()+
      scale_fill_brewer(palette="BuGn")+
      theme(plot.title = element_text(size=22))
    
  } else if (input$type == "by State") {
  
    ggplot(filtered_data(), aes(x=State,y=Sales,fill=State))+
      geom_col()+
      scale_x_discrete(labels = function(x) str_wrap(x, width = 10))+
      labs(title = "Total Sales by State",
           x = "State",
           y = "Amount")+
      theme_classic()+
      scale_fill_brewer(palette="BuGn")+ 
      theme(plot.title = element_text(size=22))+
      coord_flip()
    
  } else if (input$type == "by Ship Mode") {
    
    ggplot(filtered_data(), aes(x="", y=ShipMode, fill=ShipMode))+
      geom_bar(width = 1, stat = "identity")+coord_polar("y", start=0)+
      xlab("")+ylab("")+ scale_fill_brewer(palette="BuGn")+
      theme_minimal()
    
  }
})
  
  output$sales <- renderInfoBox({valueBox(tags$p("Total Sales",icon("usd", lib = "glyphicon"),style = "font-size: 40%;"),sum(filtered_data()$Sales),
                                          color="teal")})
  output$orders <- renderInfoBox({valueBox(tags$p("Total Orders",icon("shopping-cart", lib = "glyphicon"),style = "font-size: 40%;"),n_distinct(filtered_data()$`Order ID`),
                                          color="light-blue")})
  output$customers <- renderInfoBox({valueBox(tags$p("Total Customers",icon("user", lib = "glyphicon"),style = "font-size: 40%;"),n_distinct(filtered_data()$`Customer ID`),
                                          color="purple")})
  output$products <- renderInfoBox({valueBox(tags$p("Total Products",icon("barcode", lib = "glyphicon"),style = "font-size: 40%;"),n_distinct(filtered_data()$'Product ID'),
                                          color="olive")})
  
  output$dl <- downloadHandler(filename = 'test.jpeg',content = function(file) {
    jpeg(file)
    print(output$graph())
  })

})
