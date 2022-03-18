#' Load data from Yahoo.
#' @param ticker ticker code from Yahoo.
#' @param src source name ("yahoo" or "FRED")
#' @param from load data `from` untill today where the format of `from` is yyyy-mm-dd.
#' @param prefix logical (default is TRUE) indicating if ticker name should be included in column name of columns Change and ChangeSinceStart (only applicable for FRED data)
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
load_data <- function(ticker, src = "yahoo", from = "2014-01-01", prefix = TRUE) {

  options("getSymbols.warning4.0" = FALSE)

  data <- catch_error(
    quantmod::getSymbols(ticker, auto.assign = FALSE, from = from,
                         src = src, return.class = "data.frame")
  )

  if (!is.null(data$error)) {
    stop(paste0("Load data failed for ", ticker))
  }

  data <- data$value

  row_names <- rownames(data)

  modify_dates <- row_names %>%
    grepl(pattern = "X", x = .) %>%
    any()

  if (modify_dates) {

    data$Date <- row_names %>%
      substring(text = ., first = 2, last = 11) %>%
      gsub("\\.", "-", x = .) %>%
      as.Date()

  } else {

    data <- data %>%
      dplyr::mutate(Date = rownames(.) %>% as.Date())

  }

  data <- data %>%
    dplyr::as_tibble()

  if (src == "yahoo") {

    data <- data %>%
      dplyr::rename_with(.data = ., ~ gsub(paste0(ticker, "."), "", .x)) %>%
      dplyr::mutate(Change = price_change(Close, digits = 4),
                    ChangeSinceStart = prince_change_since_start(Close, digits = 4)) %>%
      dplyr::relocate(Date, Open, High, Low, Close, Adjusted, Change, ChangeSinceStart, Volume)

  } else {

    data <- data %>%
      dplyr::rename_with(~ gsub(ticker, "Close", .x)) %>%
      dplyr::mutate(Change = price_change(Close, digits = 4),
                    ChangeSinceStart = prince_change_since_start(Close, digits = 4)) %>%
      dplyr::relocate(Date, Close, Change, ChangeSinceStart) %>%
      rename_cols(ticker = ticker, rename = prefix)

  }

  return(data)

}

#' Change from start
#' @param x numeric vector
#' @param start integer specifying start element (default is 1, i.e. the first element of x)
#' @param digits number of digits using in rounding
#' @return a numeric vector of same length as x
#' @export
#'
prince_change_since_start <- function(x, start = 1, digits = 4) {

  round(100 * ((x - x[start]) / x[start]), digits = digits)

}

#' Rename columns in data.frame
#' @param data data.frame with columns Close, Change and ChangeSinceStart
#' @param ticker character string with ticker name
#' @param rename logical (default is TRUE). If FALSE, data is returned without any renaming
#' @return data.frame
#' @description Renaming columns from:
#' * Close -> ticker
#' * Change -> ticker_Change
#' * ChangeSinceStart -> ticker_ChangeSinceStart
#' @details This is a helper function for `load_data`
rename_cols <- function(data, ticker, rename = TRUE) {

  if (!rename) {
    return(data)
  }

  str_change <- paste0(ticker, "_Change")
  str_ChangeSinceStart <- paste0(ticker, "_ChangeSinceStart")

  data %>%
    dplyr::rename(
      !!ticker := Close,
      !!str_change := Change,
      !!str_ChangeSinceStart := ChangeSinceStart
    )

}
