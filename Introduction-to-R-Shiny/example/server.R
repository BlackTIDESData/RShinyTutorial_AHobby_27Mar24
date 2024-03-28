# server.R for creating a bar chart and scatterplot from a CSV file with an option for a regression line

# Load necessary libraries
library(shiny)
library(ggplot2) #install if you dont have this

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
    req(input$bar_variable)
    
    # Check if the selected variable exists in the data
    if (!(input$bar_variable %in% names(data()))) {
      return(NULL)
    }
    
    # Create a bar chart using ggplot2
    #try  changing the color of the plot
    ggplot(data(), aes_string(x = input$bar_variable)) +
      geom_bar(fill = "skyblue", color = "black") +
      labs(title = paste("Bar Chart of", input$bar_variable),
           x = input$bar_variable,
           y = "Frequency")
  })
  
  # Generate scatterplot with optional regression line
  output$scatterplot <- renderPlot({
    req(input$file)
    req(input$x_variable)
    req(input$y_variable)
    
    # Check if the selected variables exist in the data
    if (!(input$x_variable %in% names(data())) || !(input$y_variable %in% names(data()))) {
      return(NULL)
    }
    
    # Create a scatterplot using ggplot2
    p <- ggplot(data(), aes_string(x = input$x_variable, y = input$y_variable)) +
      geom_point(color = "blue") +
      labs(title = paste("Scatterplot of", input$x_variable, "vs", input$y_variable),
           x = input$x_variable,
           y = input$y_variable)
    
    # Add regression line if checkbox is checked
    if (input$regression_line) {
      p <- p + geom_smooth(method = "lm", se = FALSE, color = "red")
    }
    
    # Return the plot
    p
  })
}
