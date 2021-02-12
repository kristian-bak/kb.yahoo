
library(devtools)
library(roxygen2)

setwd("C:/Users/Kristian/Documents")

devtools::create("kb.yahoo")

## Files moved to Git repo

setwd("C:/Users/Kristian/Git/kb.yahoo")

## Run this line after every change to R functions or DESCRIPTION
devtools::document(pkg = "C:/Users/Kristian/Git/kb.yahoo")

devtools::install("C:/Users/Kristian/Git/kb.yahoo", upgrade = FALSE)

library(kb.yahoo)

# devtools::install_github("kristian-bak/kb.yahoo")

f_load(ticker = "MATAS.CO")
