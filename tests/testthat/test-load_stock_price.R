test_that("Load stock price works", {

  data <- load_stock_price(ticker = "SPIUSGKL.CO")

  expect_equal(names(data), c("Date", "Open", "High", "Low", "Close", "Adjusted", "Volume"))

  expect_equal(nrow(data), 1)

  expect_true(data$Close > 0)

})
