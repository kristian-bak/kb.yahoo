test_that("Test: load_tradingview_pe", {

  url <- "https://www.tradingview.com/markets/stocks-usa/sectorandindustry-industry/specialty-telecommunications/"

  res <- load_tradingview_pe(url = url)

  expect_equal(class(res), "numeric")

  expect_false(
    res %>%
      is.na() %>%
      all()
  )

})
