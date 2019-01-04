#' @title Check for new email on the server
#' @description Returns a list of the newest messages. The maximum size of the list is 20 items.
#' @details The client should not check email too many times as to not overload the server. Do not check if the email expired, the email checking routing should pause if the email expired.
#' @param sid_token character, session ID token returned from \code{\link{get_email_address}}.
#' @param seq integer, the sequence number (id) of the oldest email.
#' @return A list, representing the API response.
#' @author Philipp Ottolinger
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom httr stop_for_status
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @examples
#' \dontrun{
#' library(guerrillamail)
#' address <- get_email_address()
#' mail <- check_email(sid_token = address$sid_token, seq = 0)
#' mail
#' }
#' @export

check_email <- function(sid_token, seq) {
  request <- httr::modify_url(
    url = "https://api.guerrillamail.com/ajax.php?",
    query = list(
      "f" = "check_email",
      "sid_token" = sid_token,
      "seq" = seq
    )
  )
  response <- httr::GET(request)
  httr::stop_for_status(response)
  content <- jsonlite::fromJSON(httr::content(response, as = "text"))
  return(content)
}
