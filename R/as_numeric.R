#' As numeric
#' @param x character vector with numeric values where comma is used as thousand seperator
#'
as_numeric <- function(x) {

  gsub(",", ".", x) %>%
    as.numeric() %>%
    {. * 1000}

}
