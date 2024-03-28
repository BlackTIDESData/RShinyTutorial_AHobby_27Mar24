# UI.R for creating a bar chart from a CSV file

# Load necessary libraries
library(shiny)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Bar Chart from CKD Data"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    sidebarPanel(
      # Input: Select CSV file
      fileInput(inputId = "file", label = "Choose CSV File",
                accept = ".csv"), 
      
      # Input: Select variable for bar chart
      selectInput(inputId = "variable", label = "Select Variable",
                  choices = c("Age", "Female", "Racegrp", "Educ", 
                              "Unmarried", "Income", "CareSource", 
                              "Insured", "BMI"),
                  selected = "Age")
    ),
    
    # Main panel for displaying output
    mainPanel(
      # Output: Bar chart
      plotOutput(outputId = "bar_chart")
    )
  )
)

