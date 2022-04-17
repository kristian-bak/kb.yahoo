test_that("Test: load_yahoo_pe", {

  res <- load_yahoo_pe(ticker = c("NOVO-B.CO", "LUN.CO"))

  expect_equal(class(res), "numeric")

  expect_false(
    res %>%
      is.na() %>%
      all()
  )

})
