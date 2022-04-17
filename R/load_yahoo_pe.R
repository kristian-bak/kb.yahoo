#' Replace comma numerically
#' @param x vector of any class
#' @return numeric value
#'
replace_comma_numerically <- function(x) {
  gsub(pattern = ",", replacement = "", x = x) %>%
    as.numeric()
}

#' Get PE
#' @param ticker character string with ticker code
#' @return numeric value (1 dimensional)
#'
get_pe <- function(ticker) {

  url <- paste0("https://finance.yahoo.com/quote/", ticker, "?p=", ticker, "&.tsrc=fin-srch")

  value <- xml2::read_html(url) %>%
    rvest::html_table() %>%
    purrr::pluck(2) %>%
    dplyr::filter(X1 == "PE Ratio (TTM)") %>%
    dplyr::pull(X2)

  if (value == "N/A") {
    return(NA)
  }

  value <- replace_comma_numerically(value)

  return(value)

}

#' Load yahoo pe
#' @param ticker character vector with ticker codes
#' @param verbose logical indicating if loop counter should be on (TRUE) or off (FALSE)
#' @export
#' @return numeric vector with PE
#'
load_yahoo_pe <- function(ticker, verbose = TRUE) {

  n <- length(ticker)
  pe <- rep(NA, n)

  for (i in 1:n) {

    pe[i] <- get_pe(ticker = ticker[i])

    if (verbose) {

      cat("\r", i, "of", n)
      flush.console()

    }

  }

  return(pe)

}
