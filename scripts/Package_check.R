options(repos = c(CRAN = "https://cran.rstudio.com"))

# deSolve
if(requireNamespace("deSolve", quietly = TRUE)){
  # The package is installed
  print("R package: deSolve - installed")
} else {
  # The package is not installed
  install.packages("deSolve")
}

# ggplot2
if(requireNamespace("ggplot2", quietly = TRUE)){
  # The package is installed
  print("R package: ggplot2 - installed")
} else {
  # The package is not installed
  install.packages("ggplot2")
}

## reshape2
if(requireNamespace("reshape2", quietly = TRUE)){
  # The package is installed
  print("R package: reshape2 - installed")
} else {
  # The package is not installed
  install.packages("reshape2")
}

# stats
if(requireNamespace("stats", quietly = TRUE)){
  # The package is installed
  print("R package: stats - installed")
} else {
  # The package is not installed
  install.packages("stats")
}

## FME
if(requireNamespace("FME", quietly = TRUE)){
  # The package is installed
  print("R package: FME - installed")
} else {
  # The package is not installed
  install.packages("FME")
}

