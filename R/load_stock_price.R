#' Load stock price
#' @param ticker ticker code
#' @export
#'
load_stock_price <- function(ticker) {

  url <- paste0("https://finance.yahoo.com/quote/", ticker, "/history?p=", ticker)

  webpage <- rvest::read_html(url)

  webpage %>%
    rvest::html_table() %>%
    purrr::pluck(1) %>%
    dplyr::slice(1) %>%
    dplyr::rename(Close = `Close*`, Adjusted = `Adj Close**`) %>%
    dplyr::mutate(Date = as.Date(Date, format = "%b %d, %Y"),
                  Open = Open %>% as.numeric(),
                  High = High %>% as.numeric(),
                  Low = Low %>% as.numeric(),
                  Close = Close %>% as.numeric(),
                  Adjusted = Adjusted %>% as.numeric(),
                  Volume = as_numeric(Volume))

}
