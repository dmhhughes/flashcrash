#' discloser UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_discloser_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$div(
      id = ns("disclosure"),
      shiny::HTML(
      '<p>
      <br>
      Click the button and get a random chart from the show notes of the
      <a href="https://awealthofcommonsense.com/podcast/" target="_blank" rel="noopener noreferrer">Animal Spirits Podcast</a>
      <br>
      <br>
      <em>Not affiliated with Animal Spirits, Michael Batnick, Ben Carlson, or Ritholtz Wealth Management in any form</em>
      <br>
      <br>
      Just something made for fun by
      <a href="https://github.com/dmhhughes" target="_blank" rel="noopener noreferrer">Dylan Hughes</a>
      </p>'
      )
    )
  )
}
    
#' discloser Server Functions
#'
#' @noRd 
mod_discloser_server <- function(id, rand_chart){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    shiny::observeEvent(rand_chart(), {
      shiny::removeUI(
        selector = paste0("#", ns("disclosure")),
        session = session,
        multiple = F,
        immediate = T
      )
    })
  })
}
    
## To be copied in the UI
# mod_discloser_ui("discloser_1")
    
## To be copied in the server
# mod_discloser_server("discloser_1")
