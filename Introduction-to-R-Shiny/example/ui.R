# UI.R for creating a bar chart and scatterplot from a CSV file with an option for a regression line

# Load necessary libraries
library(shiny)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  #Rename if you would like
  titlePanel("Bar Chart and Scatterplot from CKD Data"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    sidebarPanel(
      # Input: Select CSV file
      fileInput(inputId = "file", label = "Choose CSV File",
                accept = ".csv"),
      
      # Input: Select variable for bar chart
      selectInput(inputId = "bar_variable", label = "Select Variable for Bar Chart",
                  choices = c("Age", "Female", "Racegrp", "Educ", 
                              "Unmarried", "Income", "CareSource", 
                              "Insured", "BMI"),
                  selected = "Age"),
      
      # Input: Select X variable for scatterplot
      selectInput(inputId = "x_variable", label = "Select X Variable for Scatterplot",
                  choices = c("Age", "Female", "Racegrp", "Educ", 
                              "Unmarried", "Income", "CareSource", 
                              "Insured", "BMI"),
                  selected = "Age"),
      
      # Input: Select Y variable for scatterplot
      selectInput(inputId = "y_variable", label = "Select Y Variable for Scatterplot",
                  choices = c("Age", "Female", "Racegrp", "Educ", 
                              "Unmarried", "Income", "CareSource", 
                              "Insured", "BMI"),
                  selected = "BMI"),
      
      # Checkbox: Include regression line
      checkboxInput(inputId = "regression_line", label = "Include Regression Line", value = FALSE)
    ),
    
    # Main panel for displaying output
    mainPanel(
      # Output: Bar chart
      plotOutput(outputId = "bar_chart"),
      
      # Output: Scatterplot
      plotOutput(outputId = "scatterplot")
    )
  )
)
