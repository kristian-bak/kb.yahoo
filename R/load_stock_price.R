#' Load stock price
#' @param ticker ticker code
#' @export
#'
load_stock_price <- function(ticker) {

  close <- get_stock_price(ticker = ticker)

  dplyr::tibble(
    Date = Sys.Date() %>% as.Date(),
    Open = NA,
    High = NA,
    Low = NA,
    Close = close,
    Adjusted = NA,
    Change = NA,
    Volume = NA
  )

}
