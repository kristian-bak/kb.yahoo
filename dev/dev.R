
## Document
devtools::document()

## Load
devtools::load_all()

## Run tests
devtools::test()

## Bump version number
usethis::use_version()

## Add test
usethis::use_test("load_tradingview_pe")
usethis::use_test("load_yahoo_eps")
usethis::use_test("load_yahoo_pe")

## Checking if everything works as expected
devtools::check()

## Add package
usethis::use_package("dplyr")
usethis::use_package("quantmod", min_version = "0.4.20")
usethis::use_package("rvest")
usethis::use_package("purrr")
usethis::use_package("xml2")

usethis::use_test(name = "load_stock_price")

## Renv
renv::status()
renv::snapshot()

## Run unit tests
devtools::test()

## See test coverage (Restart R session first, alternatively Click Addins -> Calculate package test coverage)
devtools::test_coverage()

## Add pipe operator
usethis::use_pipe()

## Test installing
devtools::install()

## Add README
usethis::use_readme_rmd()

## Add NEWS file
usethis::use_news_md()
