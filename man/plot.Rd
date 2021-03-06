% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R, R/proxy.R
\name{plot}
\alias{plot}
\alias{plot.stars}
\alias{image.stars}
\alias{plot.stars_proxy}
\title{plot stars object, with subplots for each level of first non-spatial dimension}
\usage{
\method{plot}{stars}(x, y, ..., join_zlim = TRUE, main = names(x)[1],
  axes = FALSE, downsample = TRUE, nbreaks = 11,
  breaks = "quantile", col = grey(1:(nbreaks - 1)/nbreaks),
  key.pos = get_key_pos(x, ...), key.width = lcm(1.8),
  key.length = 0.618, reset = TRUE, box_col = grey(0.8),
  center_time = FALSE)

\method{image}{stars}(x, ..., band = 1, attr = 1, asp = NULL,
  rgb = NULL, maxColorValue = ifelse(inherits(rgb, "data.frame"), 255,
  max(x[[attr]], na.rm = TRUE)), xlab = if (!axes) "" else names(d)[1],
  ylab = if (!axes) "" else names(d)[2], xlim = st_bbox(x)$xlim,
  ylim = st_bbox(x)$ylim, text_values = FALSE, axes = FALSE,
  interpolate = FALSE, as_points = FALSE, key.pos = NULL,
  logz = FALSE, key.width = lcm(1.8), key.length = 0.618,
  add.geom = NULL)

\method{plot}{stars_proxy}(x, y, ...,
  downsample = get_downsample(dim(x)))
}
\arguments{
\item{x}{object of class \code{stars}}

\item{y}{ignored}

\item{...}{further arguments: for \code{plot}, passed on to \code{image.stars}; for \code{image}, passed on to \code{image.default} or \code{rasterImage}.}

\item{join_zlim}{logical; if \code{TRUE}, compute a single, joint zlim (color scale) for all subplots from \code{x}}

\item{main}{character; subplot title prefix; use \code{""} to get only time, use \code{NULL} to suppress subplot titles}

\item{axes}{logical; should axes and box be added to the plot?}

\item{downsample}{logical; if \code{TRUE} will try to plot not many more pixels than actually are visibule.}

\item{nbreaks}{number of color breaks; should be one more than number of colors. If missing and \code{col} is specified, it is derived from that.}

\item{breaks}{actual color breaks, or a method name used for \link[classInt]{classIntervals}.}

\item{col}{colors to use for grid cells}

\item{key.pos}{integer; side to plot a color key: 1 bottom, 2 left, 3 top, 4 right; set to \code{NULL} to omit key. Ignored if multiple columns are plotted in a single function call. Default depends on plot size, map aspect, and, if set, parameter \code{asp}.}

\item{key.width}{amount of space reserved for width of the key (labels); relative or absolute (using lcm)}

\item{key.length}{amount of space reserved for length of the key (labels); relative or absolute (using lcm)}

\item{reset}{logical; if \code{FALSE}, keep the plot in a mode that allows adding further map elements; if \code{TRUE} restore original mode after plotting; see details.}

\item{box_col}{color for box around sub-plots; use \code{0} to suppress plotting of boxes around sub-plots.}

\item{center_time}{logical; if \code{TRUE}, sub-plot titles will show the center of time intervals, otherwise their start}

\item{band}{integer; which band (dimension) to plot}

\item{attr}{integer; which attribute to plot}

\item{asp}{numeric; aspect ratio of image}

\item{rgb}{integer; specify three bands to form an rgb composite. Experimental: rgb color table; see Details.}

\item{maxColorValue}{numeric; passed on to \link{rgb}}

\item{xlab}{character; x axis label}

\item{ylab}{character; y axis label}

\item{xlim}{x axis limits}

\item{ylim}{y axis limits}

\item{text_values}{logical; print values as text on image?}

\item{interpolate}{logical; when using \link{rasterImage} (rgb), should pixels be interpolated?}

\item{as_points}{logical; for curvilinear or sheared grids: parameter passed on to \link{st_as_sf}, determining whether raster cells will be plotted as symbols (fast, approximate) or small polygons (slow, exact)}

\item{logz}{logical; if \code{TRUE}, use log10-scale for the attribute variable. In that case, \code{breaks} and \code{at} need to be given as log10-values; see examples.}

\item{add.geom}{object of class \code{sfc}, or list with arguments to \code{plot}, that will be added to an image or sub-image}
}
\description{
plot stars object, with subplots for each level of first non-spatial dimension, and customization of legend key
}
\details{
use of an rgb color table is experimental; see https://github.com/r-spatial/mapview/issues/208

when plotting a subsetted \code{stars_proxy} object, the default value for argument \code{downsample} will not be computed correctly, and it and has to be set manually.
}
\examples{
tif = system.file("tif/L7_ETMs.tif", package = "stars")
x = read_stars(tif)
image(x, col = grey((3:9)/10))
image(x, rgb = c(1,3,5)) # rgb composite
}
