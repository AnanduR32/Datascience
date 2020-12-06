library(caret)
library(stats)
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("House price prediction App"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("square", "Square Area of plot", 0, 650, 1,step = 1),
            sliderInput("constructionTime", "Year constructed", 1950, 2020, 1,step = 1),
            radioButtons("subway", "Subway nearby:",
                         c("Yes" = "Has_Subway",
                           "No" = "No_Subway")
                         ),
            selectInput("district", "Select district:",
                         c("Chao Yang" = "ChaoYang",
                           "Chang Ping" = "ChangPing",
                           "Dong Cheng" = "DongCheng",
                           "Men Tou Gou" = "MenTouGou",
                           "Xi Cheng" = "XiCheng",
                           "Feng Tai" = "FengTai",
                           "Hai Dian" = "HaiDian",
                           "Fa Xing" = "FaXing",
                           "Fang Shang" = "FangShang",
                           "Da Xing" = "DaXing",
                           "ShiJing Shan" = "ShiJingShan",
                           "Shun Yi" = "ShunYi",
                           "Tong Zhou" = "TongZhou"
                           )),
            submitButton("submit"),
            ),
        mainPanel(
            tableOutput("print"),
        )
    ),
    
)
server <- function(input, output) {
    mdl = get(load(file ="./models/final_model.rda", .GlobalEnv))
    output$print = renderPrint({
        square = as.numeric(input$square)
        constructionTime = as.numeric(input$constructionTime)
        subway = as.character(input$subway)
        district = as.character(input$district)
        data = data.frame(square,constructionTime,subway,district)
        pred = predict(mdl, newdata = data)
        cat("<h1>Predicted value:</h1>")
        cat("<h3>The price is estimated to be: ",pred,"</h3>")
        cat("<h5>Using the parameters you can find the predicted cost of house 
            the selected region<h5>")
    })
}
shinyApp(ui = ui, server = server)
