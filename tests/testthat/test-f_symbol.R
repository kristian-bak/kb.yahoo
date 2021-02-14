context("f_get_symbol")

testthat::test_that(desc = "success", code = {
  testthat::expect_equal(object = f_get_symbol(stock = "Vestas"), "VWS.CO")
  testthat::expect_match(object = f_get_symbol(stock = "facebook123"), "Ticker code not found for")
})


