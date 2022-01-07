#' Get stock price
#' @param ticker ticker code
get_stock_price <- function(ticker) {
  
  url <- paste0("https://finance.yahoo.com/quote/", ticker, "?p=", ticker, "&.tsrc=fin-srch")
  
  xml2::read_html(url) %>% 
    rvest::html_table() %>% 
    purrr::pluck(1) %>% 
    dplyr::slice(2) %>% 
    dplyr::pull(X2) %>% 
    as.numeric()
  
}