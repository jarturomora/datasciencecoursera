#####################
# Llibraries needed #
#####################
library(data.table)

###################
# Data Extraction #
###################
# For practicity the data file was previously downloaded and  uncompresed using
# the operating system's tools and renamed as StormData.csv.
if (!exists("stormdata")) {
  print("Loading strormdata...")
  stormdata <- read.csv("StormData.csv")
} else {
  print("Stormdata already exists.")
}

#########################
# Reponse to Question 1 #
#########################

# Data preparatrion
stormdata_dt <- data.table(stormdata)
stormdata_dt$EVTYPE <- toupper(stormdata_dt$EVTYPE)
# Sum all FATALITIES per EVTYPE
harmful_events <- stormdata_dt[, sum(FATALITIES), by = EVTYPE]
harmful_events <- harmful_events[order(-V1),]
names(harmful_events) = c("EventType", "TotalFatalities")
harmful_events <- harmful_events[
  which(harmful_events$TotalFatalities > 0 & 
          substr(harmful_events$EventType, 1, 7) != "SUMMARY")
  ]

# Ploting Data
print("Most Harmful Events in the U.S. (by number of fatalities)")
print(harmful_events)

par(las = 2) # Labels are perpendicular to the axis
barplot(head(harmful_events$TotalFatalities, 10),
  main = "Top 10 Harmful Events in the U.S. From 1950 to 2011 (by Fatalities)",
  names.arg = harmful_events$EventType[1:10],
  ylab = "Number of Fatalities",
  col = rainbow(10)
  )

#########################
# Reponse to Question 2 #
#########################

# Data preparation
exponent <- c('H' = 100, 'K' = 1000, 'M' = 1000000, 'B' = 1000000000)
if (!exists("economic_impact")) {
  print("Creating the economic_impact dataframe...")
  economic_impact <- data.frame(
                                "EVTYPE" = stormdata_dt$EVTYPE,
                                "PROMDMG" = stormdata_dt$PROPDMG,
                                "PROPDMGEXP" = toupper(stormdata_dt$PROPDMGEXP),
                                "CROPDMG" = stormdata_dt$CROPDMG,
                                "CROPDMGEXP" = toupper(stormdata_dt$CROPDMGEXP)
                                )
  print("Calculating the monetary impact of each damage...")
  economic_impact$PROPDMGCASH <- economic_impact$PROMDMG * 
                              exponent[as.character(economic_impact$PROPDMGEXP)]
  economic_impact$CROPDMGCASH <- economic_impact$CROPDMG *
                              exponent[as.character(economic_impact$CROPDMGEXP)]
} else {
  print("The economic_impact dataframe already exists...")
}

# Ploting data
# A pie char showing the total money loss by properties and crop damage
windows() # Open a new plot area in windows.
slices = c(sum(economic_impact$PROPDMGCASH, na.rm = T),
           sum(economic_impact$CROPDMGCASH, na.rm = T))
lbls = c("Properties", "Crops")
pct = round(slices/sum(slices)*100)
lbls = paste(lbls, 
             format(slices,
                    decimal.mark = ".",
                    big.mark = " ",
                    small.mark = ",",
                    small.interval = 3),
             sep = "\n$ ") # add the money
lbls = paste(lbls, "\n(")
lbls = paste(lbls, pct, sep = "")
lbls = paste(lbls, "%)", sep = "")
pie(
  slices,
  lbls,
  main = "Total Money Loss From All The Severe Weather Events (USD)",
  col = c("Yellow", "Orange")
  )