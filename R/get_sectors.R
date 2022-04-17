#' Get sectors
#' @param country character string with country name (for instance "usa")
#' @return character vector with sector names
#' @export
#'
get_sectors <- function(country) {

  url <- paste0("https://www.tradingview.com/markets/stocks-",
  country, "/sectorandindustry-sector/")

  webpage <- xml2::read_html(url)

  data <- webpage %>%
    rvest::html_table() %>%
    purrr::pluck(1) %>%
    as.data.frame()

  return(data[, 1])

}

#' Get industries
#' @inheritParams get_sectors
#' @return character vector with industry names
#' @export
#'
get_industries <- function(country) {

  url <- paste0("https://www.tradingview.com/markets/stocks-",
                country, "/sectorandindustry-industry/")

  webpage <- xml2::read_html(url)

  data <- webpage %>%
    rvest::html_table() %>%
    purrr::pluck(1) %>%
    as.data.frame()

  return(data[, 1])

}
