#' Datamaps
#' 
#' @import htmltools
#' @import htmlwidgets
#' @export
datamaps <- function(..., geographyConfig = list(), width = 700, height = 400){
  payload = list(..., geographyConfig = geographyConfig)
  htmlwidgets::createWidget('datamaps', payload, 
    width = width, height = height
  )
}


#' @export
datamapsOutput <- function(outputId, width = "100%", height = "500px") {
  shinyWidgetOutput(outputId, "datamaps", width, height)
}

#' @export
renderDatamaps <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, datamapsOutput, env, quoted = TRUE)
}
