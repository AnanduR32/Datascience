library(shiny); library(miniUI)
gadgetTemplate = function(){
  ui = miniPage(
    gadgetTitleBar("Gadget template")
  )
  server = function(input, output, session){
    observeEvent(input$done, {
      stopApp()
    })
  }
  runGadget(ui, server)
}
gadgetTemplate()
