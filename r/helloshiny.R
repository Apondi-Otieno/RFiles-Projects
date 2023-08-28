
# install shiny
install.packages("shiny")

# load shiny
library(shiny)

# creates a blank web page
ui <- fluidPage(
  "Hello, world!!"
)

# define a function to create the server
server <- function(
    input,output,session) {
  
}

#Run the app
shinyApp(ui=ui, server=server)