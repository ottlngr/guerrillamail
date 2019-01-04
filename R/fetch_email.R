#' @title Get the contents of an email
#' @description Get the contents of an email.
#' @details
#' @param sid_token character, session ID token returned from \code{\link{get_email_address}}.
#' @param email_id integer, the id of the email to fetch.
#' @return A list, representing the API response.
#' @author Philipp Ottolinger
#' @seealso \code{\link{https://www.guerrillamail.com/GuerrillaMailAPI.html}}
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom httr stop_for_status
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @examples
#' \dontrun{
#' library(guerrillamail)
#' address <- get_email_address()
#' mailbox <- check_email(sid_token = address$sid_token, seq = 0)
#' message <- fetch_email(sid_token = address$id_token, email_id = min(mailbox$list$mail_id))
#' message
#' }
#' @export

fetch_email <- function(sid_token, email_id) {
  request <- httr::modify_url(
    url = "https://api.guerrillamail.com/ajax.php?",
    query = list(
      "f" = "fetch_email",
      "sid_token" = sid_token,
      "email_id" = email_id
    )
  )
  response <- httr::GET(request)
  httr::stop_for_status(response)
  content <- jsonlite::fromJSON(httr::content(response, as = "text"))
  return(content)
}
