
library(devtools)
library(roxygen2)
library(usethis)
library(testthat)

setwd("C:/Users/Kristian/Documents")

## Create a package using:

devtools::create("kb.yahoo")

## Files moved to Git repo:

setwd("C:/Users/Kristian/Git/kb.yahoo")

## Run this line after every change to R functions or DESCRIPTION
devtools::document(pkg = "C:/Users/Kristian/Git/kb.yahoo")

## Install package locally:
devtools::install("C:/Users/Kristian/Git/kb.yahoo", upgrade = FALSE)

## Install package from github:
devtools::install_github("kristian-bak/kb.yahoo")

## setup testthat (only needed to be run once):

usethis::use_testthat()

## Create new test for function f_x using: usethis::use_test("f_x")

usethis::use_test("f_load")

## run all tests:

devtools::test()

## After every change, do this:

setwd("C:/Users/Kristian/Git/kb.yahoo")
devtools::document(pkg = "C:/Users/Kristian/Git/kb.yahoo")
devtools::test(stop_on_failure = TRUE)
