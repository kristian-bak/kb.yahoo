#' Load tradingview pe
#' @param url url (for instance https://www.tradingview.com/markets/stocks-usa/sectorandindustry-sector/commercial-services/)
#' @export
#' @return numeric vector with PE for the given sector/industry
#'
load_tradingview_pe <- function(url) {

  webpage <- xml2::read_html(url)

  res <- webpage %>%
    rvest::html_table() %>%
    purrr::pluck(1) %>%
    as.data.frame()

  pe <- res[, 9]

  num_pe <- ifelse(pe == "—", NA, pe)
  num_pe <- as.numeric(num_pe)

  return(num_pe)

}
