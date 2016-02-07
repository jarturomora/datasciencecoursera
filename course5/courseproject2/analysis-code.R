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

#######################
# Data Transformation #
#######################

# Sum all FATALITIES per EVTYPE
stormdata_dt <- data.table(stormdata)
stormdata_dt$EVTYPE <- toupper(stormdata_dt$EVTYPE)
harmful_events <- stormdata_dt[, sum(FATALITIES), by = EVTYPE]
harmful_events <- harmful_events[order(-V1),]
names(harmful_events) = c("EventType", "TotalFatalities")
harmful_events <- harmful_events[
  which(harmful_events$TotalFatalities > 0 & 
          substr(harmful_events$EventType, 1, 7) != "SUMMARY")
  ]

################
# Ploting Data #
################
print("Most Harmful Events in the U.S. (by number of fatalities)")
print(harmful_events)

par(las = 2) # Labels are perpendicular to the axis
barplot(head(harmful_events$TotalFatalities, 10),
  main = "Top 10 Harmful Events in the U.S. by Fatalities",
  names.arg = harmful_events$EventType[1:10],
  col = rainbow(10)
  )