library(shiny)
library(plotly)

# Load data
bahamas_gdp <- read.csv("bahamas_gdp.csv")
bahamas_tourism <- read.csv("bahamas_visitors.csv")
caribbean_population <- read.csv("carribean_population.csv")
cruise_df <- read.csv("cruise_visitors_bahamas_1989_2023.csv")

# Convert GDP to billions for better visualization
bahamas_gdp$gdp_billions <- bahamas_gdp$gdp / 1e9


# Define UI
ui <- fluidPage(
  titlePanel("The Bahamas"),
  
  tabsetPanel(
    tabPanel(
      "Home",
      h2("Welcome to my Bahamas App"),
      p("This app provides insights into the Islands of The Bahamas, including GDP, tourism trends, lifestyle and more"),
      p("Explore the following tabs for detailed visualizations and data:"),
      tags$ul(
        tags$li("GDP: Historical GDP and world rank of the Bahamas."),
        tags$li("Tourism: Cruise Ship vs Stopover Data over the years"),
        tags$li("Map: Geographic representation of the Bahamas."),
        tags$li("Population: Population comparison to other Caribbean islands."),
        tags$li("Junkanoo: Learn about the cultural festival of the Bahamas.")
      ),
      img(src = "download-1.jpg", height = "300px", style = "margin:10px;"),
      p("The Bahamian Islands"),
      img(src = "download-2.jpg", height = "300px", style = "margin:10px;"),
      p("Swimming Pigs on Exuma Island")
    ),
    tabPanel(
      "Map",
      h3("About"),
      p("The Bahamas is an archipelago made up of around 700 islands and cays, with the most prominent inhabited islands being New Providence (where the capital Nassau is located), 
        Grand Bahama, Abaco, Eleuthera, Exuma, Andros, Cat Island, Bimini, Long Island, and Inagua; while only about 30 of these islands are actually inhabited by people, with the majority 
        of the population residing on New Providence and Grand Bahama."),
      h3("Map of The Bahamas"),
      img(src = "bs-01.jpg", height = "500px", style = "margin:10px;")
    ),
    tabPanel(
      "Population",
      h3("Population Comparison of Caribbean Islands"),
      p("The population of the Bahamas as of 2019 is 412,624, making it the 8th most populous island nation in the Caribbean."),
      p("This graph compares the population of the Bahamas to six other popular Caribbean Islands."),
      plotlyOutput("population_plot")
    ),
    tabPanel(
      "GDP",
      h3("GDP Summary"),
      p("The Bahamas' GDP reached an all-time high of $14.34 billion in 2023, supported by consistent annual growth of about 4% since 1996. In 2022, the GDP per capita was $30,995, reflecting the 
        nation's strong economic performance. Tourism remains the backbone of the economy, contributing 70% of GDP, followed by financial services at 20%. The remaining GDP stems from retail, fishing, 
        manufacturing, and agriculture."),
      h3("GDP of Bahamas (1960-2020)"),
      p("This graph shows the GDP of the Bahamas over time, measured in billions of USD. Hover over the points to see the exact GDP value, world rank, and GDP contribution percentage."),
      plotlyOutput("gdp_plot"),
      h3("GDP Rank of Bahamas (1960-2020)"),
      p("This graph shows the Bahamas' rank in global GDP over time. A lower rank indicates a better position in the global ranking. Hover over the points to see detailed information."),
      plotlyOutput("gdp_rank_plot")
    ),
    tabPanel(
      "Tourism",
      h3("Tourism Summary"),
      p("The Bahamas is a major tourist destination known for its white sandy beaches, marine life, and cultural experiences. However, the majority of tourists to the Bahamas are one-day visitors arriving on 
        cruise ships and about 97% of tourists come from the Americas. The country's attractions include its world-renowned coral reefs, underwater cave systems, shipwrecks, 
        and activities such as fishing and scuba diving. Popular spots like Arawak Cay in Nassau also offer a taste of Bahamian culture, music, and food, further enhancing its appeal as a leading Caribbean destination."),
      img(src = "cruise_2.jpg", height = "300px", style = "margin:10px;"),
      p("Cruise ships docked in Nassau, Bahamas"),
      h3("Atlantis Hotel"),
      p("The Atlantis Paradise Island Resort, located in the Bahamas, is one of the most iconic and impactful developments in the country's tourism history. Opened in 1998, the sprawling luxury resort transformed Paradise Island 
        into a global destination. Known for its stunning architecture, expansive water parks, marine habitats, and high-end accommodations, Atlantis attracts millions of visitors annually, significantly contributing to the Bahamas' economy. 
        The resort has created thousands of jobs for Bahamians, supported local businesses, and enhanced the country's international tourism profile. With attractions like the Aquaventure Water Park, Dolphin Cay, and the Royal Towers, Atlantis 
        continues to be a cornerstone of Bahamian tourism, showcasing the island's natural beauty and cultural charm while driving economic growth."),
      img(src = "atlantis.jpg", height = "300px", style = "margin:10px;"),
      p("The Atlantis Resort and Casino on Paradise Isnald"),
      h3("Tourism Visitors to The Bahamas (2000-2023)"),
      p("This graph compares the number of stopover visitors and cruise visitors to the Bahamas each year. Hover over the points to see the exact number of visitors for each category.
        You can see that there are far more visitors by cruise ship than those who stay overnight"),
      plotlyOutput("tourism_plot"),
      h3("Cruise Visitors by Port (2010-2022)"),
      p("This bar graph compares the number of cruise visitors to each major port in the Bahamas from 2010 to 2022.
        Nassau and Pradise Island have historically been first, however in recent years the outer islands have had the 
        most cruise ship visitors. This is partially due to the purchase of private islands in the Bahamas by cruise lines"),
      plotlyOutput("cruise_bar_plot")
    ),
    tabPanel(
      "Junkanoo",
      h3("Junkanoo Festival"),
      p("Junkanoo is a festival that celebrates Bahamian culture, history, and identity through a street parade of dancing, music, and colorful costumes."),
      h4("When and Where"),
      p("Junkanoo is celebrated in The Bahamas on Boxing Day (December 26) and New Year's Day (January 1). The largest parade takes place in Nassau, the capital city. Junkanoo is also celebrated in other Caribbean countries, including Jamaica and Belize, and in cities with significant West Indian populations, like Miami and Key West."),
      img(src = "junkanoo_1.jpg", height = "300px", style = "margin:10px;"),
      h4("What It's Like"),
      p("Junkanoo participants, called \"junkanooers\", dance to the beat of traditional instruments, such as cowbells, goat skin drums, whistles, and brass instruments. They wear elaborate, handmade costumes that represent various themes, characters, and historical narratives. The costumes are made from cardboard and crepe paper in \"shacks\" where practitioners share their craft and knowledge."),
      img(src = "junkanoo_2.jpg", height = "300px", style = "margin:10px;"),
      h4("Origins"),
      p("Junkanoo is believed to have originated from African traditions brought to The Bahamas by enslaved people during the colonial era. The word \u201cJunkanoo\u201d may come from the name John Canoe, an African prince and slave trader who operated on the Gold Coast in the 17th century."),
      img(src = "download-3.jpg", height = "300px", style = "margin:10px;"),
      h4("Other Events"),
      p("In addition to the main Junkanoo parades, there is also a Junior Junkanoo Parade in New Providence in December, and a Junkanoo Summer Festival in July.")
    ),
    tabPanel(
      "Data Sources",
      h3("Data Sources"),
      p("The data used in this app was sourced from the following organizations:"),
      tags$ul(
        tags$li("Global Finance Magazine"),
        tags$li("US News and World Report"),
        tags$li("Tourism Today"),
        tags$li("Tourismanalytics.com"),
        tags$li("macrotrends.net"),
        tags$li("The Bahamas Department of Tourism")
      )
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
  
  output$cruise_bar_plot <- renderPlotly({
    library(reshape2)
    cruise_filtered <- cruise_df[cruise_df$Year >= 2010 & cruise_df$Year <= 2022, ]
    cruise_filtered <- cruise_filtered[, !colnames(cruise_filtered) %in% c("Bahamas_Total")]
    cruise_melted <- melt(cruise_filtered, id.vars = "Year", variable.name = "Port", value.name = "Visitors")
    
    p <- ggplot(cruise_melted, aes(x = as.factor(Year), y = Visitors, fill = Port)) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(
        title = "Cruise Visitors by Port (2010-2022)",
        subtitle = "Comparing Major Ports in the Bahamas",
        x = "Year",
        y = "Number of Visitors",
        fill = "Port"
      ) +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, face = "bold"),
        plot.subtitle = element_text(size = 12),
        axis.title = element_text(size = 12)
      )
    
    ggplotly(p)
  })
  
  output$population_plot <- renderPlotly({
    top_population <- caribbean_population %>% 
      arrange(desc(Population)) %>% 
      head(6)
    
    p <- ggplot(top_population, aes(x = reorder(Country, -Population), y = Population, fill = Country)) +
      geom_bar(stat = "identity") +
      labs(
        title = "Population of Top Caribbean Islands",
        x = "Country",
        y = "Population",
        fill = "Country"
      ) +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title = element_text(size = 12)
      )
    
    ggplotly(p)
  })
}

# Run the app
shinyApp(ui, server)
