% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{as_matrix}
\alias{as_matrix}
\title{Get matrix from tibble}
\usage{
as_matrix(tbl, rownames = NULL, do_check = TRUE)
}
\arguments{
\item{tbl}{A tibble}

\item{rownames}{A character string of the rownames}

\item{do_check}{A boolean}
}
\value{
A matrix
}
\description{
Get matrix from tibble
}
\examples{

as_matrix(head(dplyr::select(tidybulk::counts_mini, transcript, count)), rownames=transcript)

}
