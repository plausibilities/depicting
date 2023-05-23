# Title     : InstallPackages.R
# Objective : Install Packages
# Created by: greyhypotheses
# Created on: 22/05/2023


#' Install Packages
#'
InstallPackages <- function (){

  # Packages
  packages <- c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest',
                'data.table', 'tidyverse', 'moments', 'rmarkdown', 'latex2exp', 'mapview',
                'roxygen2', 'equatiomatic', 'rstatix', 'matrixStats', 'patchwork',
                'kableExtra', 'bookdown', 'lme4', 'nlme', 'DescTools', 'pracma',
                'sf', 'raster', 'tmap', 'terra', 'spData', 'tidygeocoder', 'rnaturalearth', 'geodata')


  # Install
  .install <- function(x){
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      if (x == 'rmarkdown') {tinytex::install_tinytex()}
    }
  }
  lapply(packages, .install)



  # Kernel
  devtools::install_github('IRkernel/IRkernel')


  # Active libraries
  sessionInfo()

}