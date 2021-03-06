% Generated by roxygen2 (4.0.1): do not edit by hand
\docType{class}
\name{DailyWeather-class}
\alias{DailyWeather}
\alias{DailyWeather-class}
\title{Retrieves daily weather time-series from weather stations in Finland.}
\description{
Reference class for retrieving daily weather time-series from weather station in Finland provided
by Finnish Meteorological Institute.
You need to obtain API key in order to access the FMI open data,
https://ilmatieteenlaitos.fi/rekisteroityminen-avoimen-datan-kayttajaksi.
For more information, see https://en.ilmatieteenlaitos.fi/open-data.
For the FMI Open Data License, see http://en.ilmatieteenlaitos.fi/open-data-licence.
}
\details{
The retrieved data contains the following fields:
\describe{
  \item{coordinates}{Coordinates of the weather stations.}
  \item{date}{Observation date.}
  \item{rrday}{Precipitation.}
  \item{tday}{Mean temperature.}
  \item{snow}{Snow cover depth.}
  \item{tmin}{Minimum temperature.}
  \item{tmax}{Maximum temperature.}
}
Missing data are marked with NA.
}
\section{Methods}{

\describe{
\item{\code{getSPDF()}}{Returns retrieved weather data as a SpatialPointsDataFrame object.}

\item{\code{interpolate(templateRaster = raster::raster(extent(85000, 726000, 6629000,
  7777000), nrows = 1148, ncols = 641, crs = sp::CRS("+init=epsg:3067")))}}{Quick & dirty interpolation of the weather data. You might want to consider other approaches for better results. Returns a RasterStack object.}

\item{\code{query(startDateTime, endDateTime, bbox = raster::extent(c(19.09, 59.3, 31.59,
  70.13)), apiKey)}}{Retrieves daily weather time-series from FMI. Time interval is specified with \code{startDateTime} and \code{endDateTime} as POSIXt objects and spatial coverage with \code{bbox} as an extent object (defaults to whole Finland, CRS = WGS84). API key is given by \code{apiKey}.}
}}
\examples{
fmiApiKey <- "SPECIFY YOUR API KEY HERE"
x <- DailyWeather()
x$query(startDateTime=as.POSIXlt("2014-01-01"), endDateTime=as.POSIXlt("2014-01-01"), apiKey=fmiApiKey)
hist(x$getSPDF()@data$tday, xlab="Temperature")
y <- x$interpolate()
plot(y[["snow"]])
}
\author{
Jussi Jousimo \email{louhos@googlegroups.com}
}
\references{
See citation("gisfin")
}

