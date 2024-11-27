#' randomizer UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_randomizer_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::actionButton(ns("randomizer"), label = "Get a random chart", class = "btn-primary custom-font"),
    shiny::br(),
    shiny::br()
  )
}
    
#' randomizer Server Functions
#'
#' @noRd 
mod_randomizer_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    rand_chart <- shiny::reactive({
      get_chart()
    }) |> 
      shiny::bindEvent(input$randomizer)  
  })
}
    
## To be copied in the UI
# mod_randomizer_ui("randomizer_1")
    
## To be copied in the server
# mod_randomizer_server("randomizer_1")
