context("f_load")

testthat::test_that(desc = "success", code = {
  from_date <- Sys.Date() - 7
  dt <- f_load(ticker = "FB", from_date = from_date)
  testthat::expect_s3_class(object = dt, class = "data.table")
  testthat::expect_equal(object = names(dt), expected = c("Ticker", "Date", "Open", "Low", "High", 
                                                          "Close", "Adjusted", "Change", "Volume"))
  dt2 <- f_load(ticker = c("DANSKE.CO", "MATAS.CO"), from_date = from_date)
  n_stocks <- length(dt2[, unique(Ticker)])
  testthat::expect_equal(object = n_stocks, expected = 2)
})

testthat::test_that(desc = "error", code = {
  dt <- f_load(ticker = "ABC123")
  n_na <- sum(is.na(dt[, -1]))
  testthat::expect_equal(object = n_na, expected = 8)
})


