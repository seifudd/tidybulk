% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R, R/methods_SE.R
\docType{methods}
\name{scale_abundance}
\alias{scale_abundance}
\alias{scale_abundance,spec_tbl_df-method}
\alias{scale_abundance,tbl_df-method}
\alias{scale_abundance,tidybulk-method}
\alias{scale_abundance,SummarizedExperiment-method}
\alias{scale_abundance,RangedSummarizedExperiment-method}
\title{Scale the counts of transcripts/genes}
\usage{
scale_abundance(
  .data,
  .sample = NULL,
  .transcript = NULL,
  .abundance = NULL,
  method = "TMM",
  reference_sample = NULL,
  action = "add",
  reference_selection_function = NULL
)

\S4method{scale_abundance}{spec_tbl_df}(
  .data,
  .sample = NULL,
  .transcript = NULL,
  .abundance = NULL,
  method = "TMM",
  reference_sample = NULL,
  action = "add",
  reference_selection_function = NULL
)

\S4method{scale_abundance}{tbl_df}(
  .data,
  .sample = NULL,
  .transcript = NULL,
  .abundance = NULL,
  method = "TMM",
  reference_sample = NULL,
  action = "add",
  reference_selection_function = NULL
)

\S4method{scale_abundance}{tidybulk}(
  .data,
  .sample = NULL,
  .transcript = NULL,
  .abundance = NULL,
  method = "TMM",
  reference_sample = NULL,
  action = "add",
  reference_selection_function = NULL
)

\S4method{scale_abundance}{SummarizedExperiment}(.data, method = "TMM", reference_sample = NULL)

\S4method{scale_abundance}{RangedSummarizedExperiment}(.data, method = "TMM", reference_sample = NULL)
}
\arguments{
\item{.data}{A `tbl` formatted as | <SAMPLE> | <TRANSCRIPT> | <COUNT> | <...> |}

\item{.sample}{The name of the sample column}

\item{.transcript}{The name of the transcript/gene column}

\item{.abundance}{The name of the transcript/gene abundance column}

\item{method}{A character string. The scaling method passed to the back-end function (i.e., edgeR::calcNormFactors; "TMM","TMMwsp","RLE","upperquartile")}

\item{reference_sample}{A character string. The name of the reference sample. If NULL the sample with highest total read count will be selected as reference.}

\item{action}{A character string between "add" (default) and "only". "add" joins the new information to the input tbl (default), "only" return a non-redundant tbl with the just new information.}

\item{reference_selection_function}{DEPRECATED. please use reference_sample.}
}
\value{
A tbl object with additional columns with scaled data as `<NAME OF COUNT COLUMN>_scaled`

A tbl object with additional columns with scaled data as `<NAME OF COUNT COLUMN>_scaled`

A tbl object with additional columns with scaled data as `<NAME OF COUNT COLUMN>_scaled`

A tbl object with additional columns with scaled data as `<NAME OF COUNT COLUMN>_scaled`

A `SummarizedExperiment` object

A `SummarizedExperiment` object
}
\description{
scale_abundance() takes as input a `tbl` formatted as | <SAMPLE> | <TRANSCRIPT> | <COUNT> | <...> | and Scales transcript abundance compansating for sequencing depth (e.g., with TMM algorithm, Robinson and Oshlack doi.org/10.1186/gb-2010-11-3-r25).
}
\details{
\lifecycle{maturing}

Scales transcript abundance compensating for sequencing depth
(e.g., with TMM algorithm, Robinson and Oshlack doi.org/10.1186/gb-2010-11-3-r25).
Lowly transcribed transcripts/genes (defined with minimum_counts and minimum_proportion parameters)
are filtered out from the scaling procedure.
The scaling inference is then applied back to all unfiltered data.

Underlying method
edgeR::calcNormFactors(.data, method = c("TMM","TMMwsp","RLE","upperquartile"))
}
\examples{


 tidybulk::counts_mini \%>\%
   tidybulk(sample, transcript, count) \%>\%
   identify_abundant() \%>\%
   scale_abundance()



}
