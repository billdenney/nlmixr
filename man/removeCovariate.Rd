% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/autocovar.R
\name{removeCovariate}
\alias{removeCovariate}
\title{Remove covariate expression from a function string}
\usage{
removeCovariate(funstring, varName, covariate, theta)
}
\arguments{
\item{funstring}{a string giving the expression that needs to be modified}

\item{varName}{the variable to which the given string corresponds to in the model expression}

\item{covariate}{the covariate expression that needs to be removed (from the appropriate place)}

\item{theta}{a list of names of the 'theta' parameters in the 'fit' object}
}
\value{
returns the modified string with the covariate removed from the function string
}
\description{
Remove covariate expression from a function string
}
\author{
Vipul Mann, Matthew Fidler
}
