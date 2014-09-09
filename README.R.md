---
title: Datamaps
author: Ramnath Vaidyanathan
output: html_document
---


__NOTE: This repo is just for testing purposes__

This is an htmlwidgets binding for the datamaps package.

### Simple Map

#### World Map

```{r}
library(datamaps)
datamaps()
```

#### US Map

```{r}
datamaps(scope = 'usa')
```

### Shiny App



```{r eval = FALSE}
library(shiny)
ui = bootstrapPage(
  selectInput('def_fill', 'Select Color', c('blue', 'green')),
  datamapsOutput('mymap', 800, 400)
)

server = function(input, output, session){
  output$mymap <- renderDatamaps(
    datamaps(
      fills = list(defaultFill = input$def_fill)
    )
  )
}

runApp(list(ui = ui, server = server), launch.browser = rstudio::viewer)
```

### Map with External Data


```{r}
datamaps(
  scope = 'pcs', 
  geographyConfig = list(dataUrl = 'data/pcs.json'), 
  width = 900, height = 800
)
```

### Shiny App with External Data


```{r eval = F}
library(shiny)
ui = bootstrapPage(
  selectInput('def_fill', 'Select Color', c('blue', 'green')),
  datamapsOutput('mymap', 900, 800)
)

server = function(input, output, session){
  output$mymap <- renderDatamaps(
    datamaps(
      scope = 'pcs', 
      geographyConfig = list(dataUrl = 'data/pcs.json'),
      fills = list(defaultFill = input$def_fill)
    )
  )
}

runApp(list(ui = ui, server = server), launch.browser = rstudio::viewer)
```
