#' Datamaps
#' 
#' @import htmltools
#' @import htmlwidgets
#' @export
datamaps <- function(..., geographyConfig = list(), width = 700, height = 400){
  payload = list(..., geographyConfig = geographyConfig)
  if (!is.null(payload$geographyConfig$dataUrl)){
    dep = htmltools::htmlDependency(
      name = 'dataUrl',
      version = '0.1.0',
      src = normalizePath(dirname(payload$geographyConfig$dataUrl)),
      attachment = basename(payload$geographyConfig$dataUrl)
    )
  } else {
    dep = NULL
  }
  htmlwidgets::createWidget('datamaps', payload, 
    width = width, height = height,                          
    dependencies = dep
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
