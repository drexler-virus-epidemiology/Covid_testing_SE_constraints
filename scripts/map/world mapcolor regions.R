library(maptools)
library(sf)
library (datapasta)

# Load the world shapefile data
data(wrld_simpl)

# Filter only the Americas
america <- wrld_simpl[wrld_simpl$REGION == 19, ]

# Convert to sf object
america_sf <- st_as_sf(america)

# Save as GeoJSON
st_write(america_sf, "americas_map.geojson")

#################################################

library(rworldmap)
#df
#datapasta::df_paste()

datacountries <- data.frame(
  stringsAsFactors = FALSE,
                                        Code = c("ARM",
                                                 "MNG","BIH","BGR","HRV","HUN",
                                                 "MKD","POL","SRB","SVK",
                                                 "SVN","BLR","EST","LVA","LTU",
                                                 "RUS","UKR","AUS","NZL",
                                                 "JPN","KOR","SGP","CAN",
                                                 "USA","ARG","CHL","URY","ISR",
                                                 "AUT","BEL","CYP","DNK",
                                                 "FIN","DEU","GRC","ISL","IRL",
                                                 "ITA","LUX","MLT","NLD",
                                                 "NOR","PRT","ESP","CHE","GBR",
                                                 "BOL","ECU","PER","DOM",
                                                 "JAM","TTO","COL","CRI",
                                                 "GTM","MEX","PAN","PRY","MAR",
                                                 "BHR","IRN","IRQ","JOR",
                                                 "KWT","QAT","SAU","TUR","ARE",
                                                 "BGD","BTN","IND","NPL",
                                                 "PAK","IDN","MYS","MDV","MMR",
                                                 "PHL","LKA","THA","VNM",
                                                 "ETH","MDG","MOZ","RWA",
                                                 "UGA","ZMB","BWA","NAM","ZAF",
                                                 "ZWE","CIV","GHA","NGA",
                                                 "SEN","TGO","ALB","AND","CUB",
                                                 "FJI","KAZ","KEN","MRT",
                                                 "MWI","ROU","SLV","BTN","BRA",
                                                 "SUR","CZE","GEO","FRA",
                                                 "SWE"),
                                       GBDR7 = c("Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income","High-Income",
                                                 "High-Income",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East",
                                                 "North Africa and Middle East","South Asia",
                                                 "South Asia","South Asia",
                                                 "South Asia","South Asia",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Sub-Saharan Africa","Sub-Saharan Africa",
                                                 "Sub-Saharan Africa",
                                                 "Sub-Saharan Africa",
                                                 "Sub-Saharan Africa","Sub-Saharan Africa",
                                                 "Sub-Saharan Africa",
                                                 "Sub-Saharan Africa","Sub-Saharan Africa",
                                                 "Sub-Saharan Africa",
                                                 "Sub-Saharan Africa",
                                                 "Sub-Saharan Africa","Sub-Saharan Africa",
                                                 "Sub-Saharan Africa",
                                                 "Sub-Saharan Africa",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "High-Income",
                                                 "Latin America and Caribbean",
                                                 "Southeast Asia, East Asia, and Oceania",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Sub-Saharan Africa","Sub-Saharan Africa",
                                                 "Sub-Saharan Africa",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Latin America and Caribbean","South Asia",
                                                 "Latin America and Caribbean",
                                                 "Latin America and Caribbean",
                                                 "Central Europe, Eastern Europe, and Central Asia",
                                                 "Central Europe, Eastern Europe, and Central Asia","High-Income","High-Income"))



malMap <- joinCountryData2Map(datacountries, joinCode = "ISO3",
                              nameJoinColumn = "Code")

# This will join your malDF data.frame to the country map data
color_vector <- c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", "#A65628")

mapCountryData(malMap, nameColumnToPlot="GBDR7", catMethod = "categorical",
               missingCountryCol = gray(.8), colourPalette =color_vector)



