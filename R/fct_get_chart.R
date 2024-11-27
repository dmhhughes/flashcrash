#' get_chart 
#'
#' @description A fct function
#'
#' @return A one row data frame with variables for url, height, width, and podcast title.
#'
#' @noRd
get_chart <- function() {
  animal_spirits_charts |> dplyr::slice_sample(n = 1)
}
