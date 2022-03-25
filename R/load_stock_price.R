#' Load stock price
#' @param ticker ticker code
#' @export
#'
load_stock_price <- function(ticker) {

  url <- paste0("https://finance.yahoo.com/quote/", ticker, "/history?p=", ticker)

  webpage <- rvest::read_html(url)

  df <- webpage %>%
    rvest::html_table() %>%
    purrr::pluck(1) %>%
    dplyr::slice(1:3) %>%
    dplyr::rename(Close = `Close*`, Adjusted = `Adj Close**`)

  skip_first_row <- df %>%
    dplyr::slice(1) %>%
    dplyr::select(Open, High, Low, Close, Adjusted) %>%
    t() %>%
    as.data.frame() %>%
    dplyr::pull(V1) %>%
    is_all_blank()

  skip_second_row <- df %>%
    dplyr::slice(2) %>%
    dplyr::select(Open, High, Low, Close, Adjusted) %>%
    t() %>%
    as.data.frame() %>%
    dplyr::pull(V1) %>%
    is_all_blank()

  if (!skip_first_row) {

    id <- 1

  } else if (!skip_second_row) {

    id <- 2

  } else {

    id <- 3

  }

  df %>%
    dplyr::slice(id) %>%
    dplyr::mutate(Date = as.Date(Date, format = "%b %d, %Y"),
                  Open = Open %>% as.numeric(),
                  High = High %>% as.numeric(),
                  Low = Low %>% as.numeric(),
                  Close = Close %>% as.numeric(),
                  Adjusted = Adjusted %>% as.numeric(),
                  Volume = replace(x = Volume, Volume == "-", values = NA),
                  Volume = as_numeric(Volume))

}

#' Is all blank
#' @param x vector of any class
is_all_blank <- function(x) {

  all(x == "-")

}
