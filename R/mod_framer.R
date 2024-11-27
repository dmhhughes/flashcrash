#' framer UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_framer_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::htmlOutput(ns("frame"))
  )
}
    
#' framer Server Functions
#'
#' @noRd 
mod_framer_server <- function(id, rand_chart){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$frame <- shiny::renderUI({
      tags$iframe(src = rand_chart()$src, height = rand_chart()$height + 10, width = rand_chart()$width + 10)
    })
  })
}
    
## To be copied in the UI
# mod_framer_ui("framer_1")
    
## To be copied in the server
# mod_framer_server("framer_1")
