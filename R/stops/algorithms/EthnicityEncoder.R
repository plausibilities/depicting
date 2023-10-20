# Title     : EthnicityEncoder.R
# Objective : Ethicity Encoder
# Created by: greyhypotheses
# Created on: 29/05/2023


#' Ethnicity Encoder
#'
#' @param blob: The dataframe hosting the ethnicity fields of interesting
#' @param fields: The ethnicity fields to be encoded
#'
EthnicityEncoder <- function(blob, fields) {

  # The encoding function; if the field value is NA, zero is
  # assigned, otherwise 1 is assigned.
  temporary <- function(x) {

    y <- case_when(
      is.na(x) ~ 0,
      TRUE ~ 1)
    y <- factor(y, levels = c(0, 1))

    return(y)
  }

  # Encode the fields in question
  K <- lapply(X = blob[, fields], FUN = temporary)

  # Replace the original fields with their encoded forms
  blob[, fields] <- dplyr::bind_cols(K)


  return(blob)

}