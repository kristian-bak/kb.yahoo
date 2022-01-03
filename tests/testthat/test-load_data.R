test_that("Load data works", {

  data <- load_data(ticker = "NOVO-B.CO", from = "2021-01-01")

  cols <- c("Date", "Open", "High", "Low", "Close", "Adjusted", "Change", "Volume")

  ## Expecting identical column names
  expect_identical(names(data), cols)

  price <- data %>%
    dplyr::filter(Date == "2021-01-05") %>%
    dplyr::pull(Close) %>%
    round(2)

  ## Expecting a certain closing value in the first row
  expect_equal(price, 423.95)

  ## Expecting failure for unknown ticker
  expect_error(
    load_data(ticker = "Unknown", from = "2021-01-01"),
    "Load data failed for Unknown"
  )

})
