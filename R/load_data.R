#' Load data from Yahoo.
#' @param ticker ticker code from Yahoo.
#' @param src source name ("yahoo" or "FRED")
#' @param from load data `from` untill today where the format of `from` is yyyy-mm-dd.
#' @return A data.frame
#' @examples
#' # Load NOVO data since 2021-01-01
#' data <- load_data(ticker = "NOVO-B.CO", from = "2021-01-01")
#' data
#'
#' # Load Market Yield on U.S. Treasury Securities at 10-Year Constant Maturity
#' data <- load_data(ticker = "DGS10", src = "FRED")
#' data
#' @export
#'
load_data <- function(ticker, src = "yahoo", from = "2014-01-01") {

  data <- catch_error(
    quantmod::getSymbols(ticker, auto.assign = FALSE, from = from, src = src)
  )

  if (!is.null(data$error)) {
    stop(paste0("Load data failed for ", ticker))
  }

  data <- data$value %>%
    as.data.frame() %>%
    dplyr::mutate(Date = rownames(.) %>% as.Date()) %>%
    dplyr::as_tibble()

  if (src == "yahoo") {

    data <- data %>%
      dplyr::rename_with(.data = ., ~ gsub(paste0(ticker, "."), "", .x)) %>%
      dplyr::mutate(Change = price_change(Close, digits = 4),
                    ChangeFromStart = prince_change_from_start(Close, digits = 4)) %>%
      dplyr::relocate(Date, Open, High, Low, Close, Adjusted, Change, ChangeFromStart, Volume)

  } else {

    data <- data %>%
      dplyr::rename_with(~ gsub(ticker, "Close", .x)) %>%
      dplyr::mutate(Change = price_change(Close, digits = 4),
                    ChangeFromStart = prince_change_from_start(Close, digits = 4)) %>%
      dplyr::relocate(Date, Close, Change, ChangeFromStart)

  }

  return(data)

}

#' Change from start
#' @param x numeric vector
#' @param digits number of digits using in rounding
#'
prince_change_from_start <- function(x, digits = 4) {

  round(100 * ((x - x[1]) / x), digits = digits)

}
