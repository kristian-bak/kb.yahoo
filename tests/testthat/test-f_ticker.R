context("f_ticker")

testthat::test_that(desc = "success", code = {
  testthat::expect_equal(f_ticker(stock = "abc"), "abc")
})


