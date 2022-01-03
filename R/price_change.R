#' Daily price change in percent
#' @param x stock price
#' @return A numerical vector with prince changes in percent
#'
price_change <- function(x, digits = 5) {
  x_lag <- c(NA, x)
  x <- c(x, NA)
  y <- round((x - x_lag) / x, digits)
  y <- 100 * y[-length(y)]
  return(y)
}
