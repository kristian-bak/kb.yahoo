
## Document
devtools::document()

## Load
devtools::load_all()

## Add package
usethis::use_package("dplyr")
usethis::use_package("quantmod")

## Renv
renv::status()
renv::snapshot()

## Run unit tests
devtools::test()

## See test coverage (alternatively Click Addins -> Calculate package test coverage)
devtools::test_coverage()

## Bump versionnumber
usethis::use_version()

## Add pipe operator
usethis::use_pipe()
