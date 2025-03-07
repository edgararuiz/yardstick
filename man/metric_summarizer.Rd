% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/template.R
\name{metric_summarizer}
\alias{metric_summarizer}
\title{Developer function for summarizing new metrics}
\usage{
metric_summarizer(
  metric_nm,
  metric_fn,
  data,
  truth,
  estimate,
  estimator = NULL,
  na_rm = TRUE,
  event_level = NULL,
  case_weights = NULL,
  ...,
  metric_fn_options = list()
)
}
\arguments{
\item{metric_nm}{A single character representing the name of the metric to
use in the \code{tibble} output. This will be modified to include the type
of averaging if appropriate.}

\item{metric_fn}{The vector version of your custom metric function. It
generally takes \code{truth}, \code{estimate}, \code{na_rm}, and any other extra arguments
needed to calculate the metric.}

\item{data}{The data frame with \code{truth} and \code{estimate} columns passed
in from the data frame version of your metric function that called
\code{metric_summarizer()}.}

\item{truth}{The unquoted column name corresponding to the \code{truth} column.}

\item{estimate}{Generally, the unquoted column name corresponding to
the \code{estimate} column. For metrics that take multiple columns through \code{...}
like class probability metrics, this is a result of \code{\link[=dots_to_estimate]{dots_to_estimate()}}.}

\item{estimator}{For numeric metrics, this is left as \code{NULL} so averaging
is not passed on to the metric function implementation. For classification
metrics, this can either be \code{NULL} for the default auto-selection of
averaging (\code{"binary"} or \code{"macro"}), or a single character to pass along
to the metric implementation describing the kind of averaging to use.}

\item{na_rm}{A \code{logical} value indicating whether \code{NA} values should be
stripped before the computation proceeds. The removal is executed in
\code{metric_vec_template()}.}

\item{event_level}{For numeric metrics, this is left as \code{NULL} to prevent
it from being passed on to the metric function implementation. For
classification metrics, this can either be \code{NULL} to use the default
\code{event_level} value of the \code{metric_fn} or a single string of either
\code{"first"} or \code{"second"} to pass along describing which level should be
considered the "event".}

\item{case_weights}{For metrics supporting case weights, an unquoted
column name corresponding to case weights can be passed here. If not \code{NULL},
the case weights will be passed on to \code{metric_fn} as the named argument
\code{case_weights}.}

\item{...}{Currently not used. Metric specific options are passed in
through \code{metric_fn_options}.}

\item{metric_fn_options}{A named list of metric specific options. These
are spliced into the metric function call using \verb{!!!} from \code{rlang}. The
default results in nothing being spliced into the call.}
}
\description{
\code{metric_summarizer()} is useful alongside \code{\link[=metric_vec_template]{metric_vec_template()}} for
implementing new custom metrics. \code{metric_summarizer()} calls the metric
function inside \code{dplyr::summarise()}. \code{metric_vec_template()} is a
generalized function that calls the core implementation of a metric function,
and includes a number of checks on the types, lengths, and argument inputs.
See \href{https://www.tidymodels.org/learn/develop/metrics/}{Custom performance metrics} for more
information.
}
\details{
\code{metric_summarizer()} is generally called from the data frame version
of your metric function. It knows how to call your metric over grouped data
frames and returns a \code{tibble} consistent with other metrics.
}
\seealso{
\code{\link[=metric_vec_template]{metric_vec_template()}} \code{\link[=finalize_estimator]{finalize_estimator()}} \code{\link[=dots_to_estimate]{dots_to_estimate()}}
}
