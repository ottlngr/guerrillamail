% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fetch_email.R
\name{fetch_email}
\alias{fetch_email}
\title{Get the contents of an email}
\usage{
fetch_email(sid_token, email_id)
}
\arguments{
\item{sid_token}{character, session ID token returned from \code{\link{get_email_address}}.}

\item{email_id}{integer, the id of the email to fetch.}
}
\value{
A list, representing the API response.
}
\description{
Get the contents of an email.
}
\examples{
\dontrun{
library(guerrillamail)
address <- get_email_address()
mailbox <- check_email(sid_token = address$sid_token, seq = 0)
message <- fetch_email(sid_token = address$id_token, email_id = min(mailbox$list$mail_id))
message
}
}
\seealso{
\code{\link{https://www.guerrillamail.com/GuerrillaMailAPI.html}}
}
\author{
Philipp Ottolinger
}
