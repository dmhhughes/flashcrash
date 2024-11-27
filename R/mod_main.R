#' main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_main_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shiny::fluidRow(
      shiny::column(12,
                    align = "center",
                    shiny::h1("Animal Spirits View-Master", class = "custom-font"),
                    shiny::actionButton(ns("randomizer"), label = "Get a random chart", class = "btn-primary custom-font"),
      )
    ),
    shiny::fluidRow(shiny::column(12, align = "center", tags$div(
      id = ns("disclosure"),
      shiny::HTML(
      '<p>
      <br>
      Click the button and get a random chart from the show notes of the
      <a href="https://podcasts.thecompoundnews.com/show/animalspirits/">Animal Spirits Podcast</a>
      <br>
      <br>
      <em>Not affiliated with Animal Spirits, Michael Batnick, Ben Carlson, or Ritholtz Wealth Management in any form</em>
      <br>
      <br>
      Just something made for fun by
      <a href="https://github.com/dmhhughes">Dylan Hughes</a>
      </p>'
      )
    ))), 
    shiny::fluidRow(
      shiny::column(12,
                    align = "center",
                    tags$br(),
                    shiny::htmlOutput(ns("frame"))
      )
    ),
    shiny::fluidRow(
      shiny::column(12,
                    align = "center",
                    tags$strong(shiny::htmlOutput(ns("title")))
      )
    )
  )
}
    
#' main Server Functions
#'
#' @noRd 
mod_main_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    rand_chart <- shiny::reactive({
      get_chart()
    }) |> 
      shiny::bindEvent(input$randomizer)
    
    shiny::observeEvent(input$randomizer, {
      shiny::removeUI(
        selector = paste0("#", ns("disclosure")),
        session = session,
        multiple = F,
        immediate = T
      )
    })
    
    output$frame <- shiny::renderUI({
      tags$iframe(src = rand_chart()$src, height = rand_chart()$height + 10, width = rand_chart()$width + 10)
    })
    
    output$title <- shiny::renderUI({
      tags$a(href = paste0("https://awealthofcommonsense.com", rand_chart()$link), rand_chart()$title)
    })
  })
}
    
## To be copied in the UI
# mod_main_ui("main_1")
    
## To be copied in the server
# mod_main_server("main_1")
