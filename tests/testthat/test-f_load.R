context("f_load")

testthat::test_that(desc = "success", code = {
  from_date <- Sys.Date() - 7
  dt <- f_load("FB", from_date = from_date)
  testthat::expect_s3_class(object = dt, class = "data.table")
  testthat::expect_equal(object = names(dt), expected = c("Date", "Open", "Low", "High", 
                                                          "Close", "Adjusted", "Change", "Volume"))
})

testthat::test_that(desc = "error", code = {
  testthat::expect_match(object = f_load(ticker = "ABC123")$message, "Unable to import")
})


