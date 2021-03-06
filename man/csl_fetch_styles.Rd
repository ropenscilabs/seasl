% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_styles.R
\name{csl_fetch_styles}
\alias{csl_fetch_styles}
\title{Get CSL styles from the web}
\usage{
csl_fetch_styles(...)
}
\arguments{
\item{...}{Curl options passed on to \link[crul:HttpClient]{crul::HttpClient}}
}
\value{
path (character) to the files (invisibly)
}
\description{
Pulls down all CSL style files into a directory on your machine,
returning the path to that directory
}
\details{
Files are stored in
\code{paste0(rappdirs::user_cache_dir(), "/R/seasl/styles")}. See \link{csl_cache}
for more
}
\examples{
\dontrun{
csl_fetch_styles()
}
}
\references{
https://github.com/citation-style-language/styles-distribution
}
