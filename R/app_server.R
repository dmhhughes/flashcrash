#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  rand_chart <- mod_randomizer_server("randomizer_1")
  mod_discloser_server("discloser_1", rand_chart)
  mod_framer_server("framer_1", rand_chart)
  mod_titler_server("titler_1", rand_chart)
}
