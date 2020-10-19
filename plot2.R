tot.emissions.baltimore <- NEI %>%            # Group by year and summarize total emissions across the board
        subset(fips == "24510") %>%
        group_by(year) %>%
        summarize(Total.Emissions.Baltimore = sum(Emissions, 
                                                  na.rm = TRUE))
    
with(tot.emissions.baltimore,              # plot data
     plot(x = year,  
          y = Total.Emissions.Baltimore, 
          ylab = "Total Annual Emissions [Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in Baltimore by Year",
          cex = 2,
          pch = 2,
          col = "red",
          lwd = 3))
          
# Find delta between 2008 and 1999
tot.emissions.baltimore.2008 <- tot.emissions.baltimore[tot.emissions.baltimore$year == 2008, 2]
tot.emissions.baltimore.1999 <- tot.emissions.baltimore[tot.emissions.baltimore$year == 1999, 2]

delta.emissions.baltimore <- tot.emissions.baltimore.2008 - tot.emissions.baltimore.1999
