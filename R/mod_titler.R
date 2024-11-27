#' titler UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_titler_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::htmlOutput(ns("title"))
  )
}
    
#' titler Server Functions
#'
#' @noRd 
mod_titler_server <- function(id, rand_chart){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$title <- shiny::renderUI({
      tags$a(href = rand_chart()$full_pod_link, target = "_blank", rel = "noopener noreferrer", rand_chart()$title)
    })
  })
}
    
## To be copied in the UI
# mod_titler_ui("titler_1")
    
## To be copied in the server
# mod_titler_server("titler_1")
