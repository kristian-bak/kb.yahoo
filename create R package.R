
library(devtools)
library(roxygen2)

setwd("C:/Users/Kristian/Documents")

devtools::create("kb.yahoo")

## Files moved to Git repo

setwd("C:/Users/Kristian/Git/kb.yahoo")

document()

install("C:/Users/Kristian/Git/kb.yahoo")

library(kb.yahoo)