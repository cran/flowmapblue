## -----------------------------------------------------------------------------
library(flowmapblue)


## -----------------------------------------------------------------------------
#| eval: false
## # Set your Mapbox access token
## Sys.setenv(MAPBOX_API_TOKEN = "YOUR_MAPBOX_ACCESS_TOKEN")


## -----------------------------------------------------------------------------
locations <- data(ch_locations)
flows <- data(ch_flows)


## -----------------------------------------------------------------------------
str(locations)


## -----------------------------------------------------------------------------
str(flows)


## -----------------------------------------------------------------------------
flowmap <- flowmapblue(
  locations = locations,
  flows = flows,
  mapboxAccessToken = Sys.getenv('MAPBOX_API_TOKEN'),
  clustering = TRUE,
  darkMode = TRUE,
  animation = FALSE
)


## -----------------------------------------------------------------------------
flowmap


## -----------------------------------------------------------------------------
#| eval: true
#| echo: false
#| results: 'asis'

# Determine if we are in pkgdown and insert gif
is_pkgdown <- Sys.getenv("IN_PKGDOWN") == "true"
if (is_pkgdown) {
  cat('![](webmedia/demo.gif)')
} else {
  # If not in pkgdown, insert static image
  cat('![](../man/figures/demo.png)')
}


## -----------------------------------------------------------------------------
#| eval: false
## # Save the map to an HTML file
## htmlwidgets::saveWidget(flowmap, file = "flowmap.html")


## -----------------------------------------------------------------------------
# Generate fake datetime for flows
flows$time <- seq(from = as.POSIXct("2020-01-01"), to = as.POSIXct("2020-01-05"), length.out = nrow(flows))

flowmap <- flowmapblue(
  locations = locations,
  flows = flows,
  mapboxAccessToken = Sys.getenv('MAPBOX_API_TOKEN'),
  clustering = TRUE,
  darkMode = TRUE,
  animation = FALSE
)

# View the map
flowmap


## -----------------------------------------------------------------------------
#| eval: true
#| echo: false
#| results: 'asis'

# Determine if we are in pkgdown and insert gif
is_pkgdown <- Sys.getenv("IN_PKGDOWN") == "true"
if (is_pkgdown) {
  cat('![](webmedia/demo_datetime.gif)')
} else {
  # If not in pkgdown, insert static image
  cat('![](../man/figures/demo_datetime.png)')
}


## -----------------------------------------------------------------------------
# Generate fake dates for flows
flows$time <- seq(from = as.Date("2020-01-01"), to = as.Date("2020-06-01"), length.out = nrow(flows))

flowmap <- flowmapblue(
  locations = locations,
  flows = flows,
  mapboxAccessToken = Sys.getenv('MAPBOX_API_TOKEN'),
  clustering = TRUE,
  darkMode = TRUE,
  animation = FALSE
)

# View the map
flowmap


## -----------------------------------------------------------------------------
#| eval: true
#| echo: false
#| results: 'asis'

# Determine if we are in pkgdown and insert gif
is_pkgdown <- Sys.getenv("IN_PKGDOWN") == "true"
if (is_pkgdown) {
  cat('![](webmedia/demo_date.gif)')
} else {
  # If not in pkgdown, insert static image
  cat('![](../man/figures/demo_date.png)')
}

