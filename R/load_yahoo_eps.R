#' Load yahoo eps
#' @param ticker ticker code
#' @return numeric value (one dimensional)
#'
load_yahoo_eps <- function(ticker) {

  url <- paste0("https://finance.yahoo.com/quote/", ticker, "?p=", ticker, "&.tsrc=fin-srch")

  xml2::read_html(url) %>%
    rvest::html_table() %>%
    purrr::pluck(2) %>%
    dplyr::filter(X1 == "EPS (TTM)") %>%
    dplyr::pull(X2) %>%
    as.numeric()

}
