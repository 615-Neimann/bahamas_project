library(shiny)
library(plotly)

# Load data
bahamas_gdp <- read.csv("bahamas_gdp.csv")
bahamas_tourism <- read.csv("bahamas_visitors.csv")

# Convert GDP to billions for better visualization
bahamas_gdp$gdp_billions <- bahamas_gdp$gdp / 1e9

# Define UI
ui <- fluidPage(
  titlePanel("Bahamas Analysis"),
  
  tabsetPanel(
    tabPanel(
      "Home",
      h2("Welcome to the Bahamas Data Analysis App"),
      p("This app provides insights into the GDP and tourism trends of the Bahamas."),
      p("Explore the following tabs for detailed visualizations and data:"),
      tags$ul(
        tags$li("GDP: Explore the historical GDP and world rank of the Bahamas."),
        tags$li("Tourism: Compare stopover and cruise visitors over the years."),
        tags$li("Map: View a geographic representation of the Bahamas.")
      ),
      img(src = "download-1.jpg", height = "300px", style = "margin:10px;"),
      img(src = "download-2.jpg", height = "300px", style = "margin:10px;")
    ),
    tabPanel(
      "GDP",
      h3("GDP of Bahamas (1960-2020)"),
      p("This graph shows the GDP of the Bahamas over time, measured in billions of USD. Hover over the points to see the exact GDP value, world rank, and GDP contribution percentage."),
      plotlyOutput("gdp_plot"),
      h3("GDP Rank of Bahamas (1960-2020)"),
      p("This graph shows the Bahamas' rank in global GDP over time. A lower rank indicates a better position in the global ranking. Hover over the points to see detailed information."),
      plotlyOutput("gdp_rank_plot")
    ),
    tabPanel(
      "Tourism",
      h3("Tourism Visitors to The Bahamas (2000-2023)"),
      p("This graph compares the number of stopover visitors and cruise visitors to the Bahamas each year. Hover over the points to see the exact number of visitors for each category."),
      plotlyOutput("tourism_plot")
    ),
    tabPanel(
      "Map",
      h3("Map of The Bahamas"),
      img(src = "bs-01.jpg", height = "500px", style = "margin:10px;")
    )
  )
)

# Define Server
server <- function(input, output, session) {
  
  output$gdp_plot <- renderPlotly({
    p <- ggplot(bahamas_gdp, aes(x = year, y = gdp_billions)) +
      geom_line(color = "blue", size = 1.2) +
      geom_point(aes(text = paste(
        "Year:", year, "<br>",
        "GDP (USD):", round(gdp, 2), "<br>",
        "World Rank:", rank, "<br>",
        "GDP Contribution (%):", round(gdp_percent * 100, 2), "%"
      )), 
      color = "darkblue", size = 2) +
      labs(
        title = "GDP of Bahamas (1960-2020)",
        subtitle = "GDP in Billion USD",
        x = "Year",
        y = "GDP (Billion USD)"
      ) +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, face = "bold"),
        plot.subtitle = element_text(size = 12),
        axis.title = element_text(size = 12)
      )
    
    ggplotly(p, tooltip = "text")
  })
  
  output$gdp_rank_plot <- renderPlotly({
    p <- ggplot(bahamas_gdp, aes(x = year, y = rank)) +
      geom_line(color = "green", size = 1.2) +
      geom_point(aes(text = paste(
        "Year:", year, "<br>",
        "GDP (USD):", round(gdp, 2), "<br>",
        "World Rank:", rank, "<br>",
        "GDP Contribution (%):", round(gdp_percent * 100, 2), "%"
      )), 
      color = "darkgreen", size = 2) +
      labs(
        title = "GDP Rank of Bahamas (1960-2020)",
        subtitle = "Rank in world GDP",
        x = "Year",
        y = "Rank"
      ) +
      scale_y_reverse() +  # Flip rank to show lower ranks at the top
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, face = "bold"),
        plot.subtitle = element_text(size = 12),
        axis.title = element_text(size = 12)
      )
    
    ggplotly(p, tooltip = "text")
  })
  
  output$tourism_plot <- renderPlotly({
    p <- ggplot(bahamas_tourism, aes(x = as.numeric(Year))) +
      geom_line(aes(y = as.numeric(Stopover.Visitors), color = "Stopover Visitors"), size = 1.2) +
      geom_line(aes(y = as.numeric(Cruise.Visitors), color = "Cruise Visitors"), size = 1.2) +
      geom_point(aes(y = as.numeric(Stopover.Visitors), text = paste(
        "Year:", Year, "<br>",
        "Stopover Visitors:", Stopover.Visitors
      )), color = "red", size = 2) +
      geom_point(aes(y = as.numeric(Cruise.Visitors), text = paste(
        "Year:", Year, "<br>",
        "Cruise Visitors:", Cruise.Visitors
      )), color = "blue", size = 2) +
      labs(
        title = "Tourism Visitors to The Bahamas (2000-2023)",
        subtitle = "Stopover vs Cruise Visitors",
        x = "Year",
        y = "Number of Visitors"
      ) +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, face = "bold"),
        plot.subtitle = element_text(size = 12),
        axis.title = element_text(size = 12),
        legend.title = element_blank()
      )
    
    ggplotly(p, tooltip = "text")
  })
}

# Run the app
shinyApp(ui, server)
