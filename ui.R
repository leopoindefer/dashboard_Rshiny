#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(rAmCharts)
library(stringr)
library(colourpicker)


# Define UI for application that draws a histogram
shinyUI(
  dashboardPage(
    dashboardHeader(title="H&M SALES",
                    tags$li(class="dropdown",tags$a(href="https://github.com/leopoindefer/dashboard",icon("github"),"My Code",target="_blank"))),
      dashboardSidebar(
        selectInput("type","Analyse Sales",
                     choices=list("by Month","by Sub-category","by State","by Ship Mode")),
        dateRangeInput("Time",
                    "Period",
                    start = "2018-01-01",
                    end = "2018-12-31",
                    min = "2018-01-01",
                    max = "2018-12-31",
                    format="dd/mm/yy",
                    separator = " - "),
        selectInput("cate","Categories",
                    unique(HM_Sales$Category))
      ),
    dashboardBody(
      fluidRow(column(12,
        valueBoxOutput("sales",width=3),
        valueBoxOutput("orders",width=3),
        valueBoxOutput("customers",width=3),
        valueBoxOutput("products",width=3))
      ),
      plotOutput("graph"),
      downloadButton('dl','Télécharger')
    )
  )
)
