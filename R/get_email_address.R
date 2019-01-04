#' @title Get an email address from Guerrilla Mail
#' @description Request a new email address from Guerrilla Mail.
#' @details The use of \code{ip} and \code{agent} is recommended when making requests for clients from server side.
#' @param lang character, a string representing the language code. Currently supported: en, fr, nl, ru, tr, uk, ar, ko, jp, zh, zh-hant, de, es, it, pt.
#' @param sid_token character, the session id token used to maintain state.
#' @param site character, if you have your own domain and would like to access your custom domains, use this site identifier for your site. Defaults to guerrillamail.com.
#' @param ip character, the ip address of the client.
#' @param agent character, the user agent of the client.
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
#' address
#' }
#' @export

get_email_address <- function(lang = "en", sid_token = NULL, site = NULL, ip = NULL, agent = NULL) {
  request <- httr::modify_url(
    url = "https://api.guerrillamail.com/ajax.php?",
    query = list(
      "f" = "get_email_address",
      "lang" = lang,
      "sid_token" = sid_token,
      "site" = site,
      "ip" = ip,
      "agent" = agent
    )
  )
  response <- httr::GET(request)
  httr::stop_for_status(response)
  content <- jsonlite::fromJSON(httr::content(response, as = "text"))
  return(content)
}
