head(NEI) # Observe what is inside the dataset
tot.emissions.year <- NEI %>%  # Group by year and summarize total emissions across the board
    group_by(year) %>%
    summarize(Total.Emissions = sum(Emissions, na.rm = TRUE))

tot.emissions.year
with(tot.emissions.year, # plot data 
     plot(x = year, 
          y = Total.Emissions, 
          ylab = "Total Annual Emissions [Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in the US by Year",
          cex = 2,
          pch = 2,
          col = "red",
          lwd = 3))
# Find delta between 2008 and 1999
tot.emissions.2008 <- tot.emissions.year[tot.emissions.year$year == 2008, 2]
tot.emissions.1999 <- tot.emissions.year[tot.emissions.year$year == 1999, 2]

delta.tot.emissions <- tot.emissions.2008 - tot.emissions.1999
