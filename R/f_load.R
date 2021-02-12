#' This function is an extension of tryCatch
#' @param expr expression to evalute
#'
#' @return A list with value, warning and error message
#' @export

f_try_catch <- function(expr) {
  warn <- err <- NULL
  value <- withCallingHandlers(
    tryCatch(expr, error = function(e) {
      err <<- e
      NULL
    }), warning=function(w) {
      warn <<- w
      invokeRestart("muffleWarning")
    })
  list(value = value, warning = warn, error = err)
}

#' This function is used to calculate price change in %
#' @param x stock price
#'
#' @return A vector with prince changes in %
#' @export

f_change <- function(x, digits = 5) {
  x_lag <- c(NA, x)
  x <- c(x, NA)
  y <- round((x - x_lag) / x, digits)
  y <- 100 * y[-length(y)]
  return(y)
}

#' This function loads data from Yahoo.
#' @param ticker ticker code from Yahoo
#' @param from_date loads data from the date untill today. Date format is yyyy-mm-dd. 
#'
#' @return A data.table
#' @export
#' @import data.table 
#' @import quantmod

f_load <- function(ticker, from_date = "2014-01-01") {
  
  data <- f_try_catch(quantmod::getSymbols(ticker, auto.assign = FALSE, 
                                           from = from_date, src = 'yahoo'))
  if (is.null(data$value)) {
    return(data$error)
  }
  
  data <- data$value
  data <- data.frame(data)
  data$Date <- rownames(data)
  data <- data.table::data.table(data)
  
  data.table::setnames(data, 
                       old = names(data)[grepl(ticker, names(data))], 
                       new = gsub(paste0(ticker, "."), "", names(data)[grepl(ticker, names(data))]))
  
  data[, Change := f_change(Close)][]
  
  data.table::setcolorder(data, neworder = c("Date", "Open", "Low", "High", "Close", "Adjusted", "Change", "Volume"))
  
  return(data)
  
}
