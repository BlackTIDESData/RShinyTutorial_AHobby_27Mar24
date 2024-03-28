# server.R for creating a bar chart from a CSV file

# Load necessary libraries
library(shiny)
library(ggplot2) #install if you dont have this one

# Define server logic
server <- function(input, output) {
  
  # Read CSV file
  data <- reactive({
    req(input$file)
    read.csv(input$file$datapath, header = TRUE)
  })
  
  # Generate bar chart
  output$bar_chart <- renderPlot({
    req(input$file)
    
    # Check if the selected variable exists in the data
    if (!(input$variable %in% names(data()))) {
      return(NULL)
    }
    
    # Create a bar chart using ggplot2
    ggplot(data(), aes_string(x = input$variable)) +
      geom_bar(fill = "skyblue", color = "black") +
      labs(title = paste("Bar Chart of", input$variable),
           x = input$variable,
           y = "Frequency")
  })
}
