test_that("Test: load_yahoo_eps", {

  res <- load_yahoo_eps(ticker = "NOVO-B.CO")

  expect_equal(class(res), "numeric")

  expect_false(is.na(res))

})
