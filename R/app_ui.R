#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      theme = bslib::bs_theme(
        bootswatch = "quartz",
        "body-bg-image" = "linear-gradient(90deg, #061019 0%, #162a3b 50%, #4a84b6 100%)",
        base_font = bslib::font_google("Yusei Magic")
      ),
      shiny::fluidRow(
        shiny::column(12,
                      align = "center",
                      shiny::h1("Animal Spirits View-Master", class = "custom-font"),
                      mod_randomizer_ui("randomizer_1")
        )
      ),
      shiny::fluidRow(
        shiny::column(12,
                      align = "center",
                      mod_discloser_ui("discloser_1")
        )
      ),
      shiny::fluidRow(
        shiny::column(12,
                      align = "center",
                      mod_framer_ui("framer_1")
        )
      ),
      shiny::fluidRow(
        shiny::column(12,
                      align = "center",
                      mod_titler_ui("titler_1")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(ext = 'png'),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "flashcrash"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
