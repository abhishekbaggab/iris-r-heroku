library(shiny)

# Training set
TrainSet <- read.csv("training.csv", header = TRUE)
TrainSet <- TrainSet[,-1]

pageWithSidebar(

  # Page header
  headerPanel('Covid Predictor'),

  # Input values
  sidebarPanel(
    HTML("<h3>Input parameters</h4>"),
    sliderInput("Sepal.Length", label = "Fever", value = 5.0,
                min = min(TrainSet$Sepal.Length),
                max = max(TrainSet$Sepal.Length)
    ),
    sliderInput("Sepal.Width", label = "Headache", value = 3.6,
                min = min(TrainSet$Sepal.Width),
                max = max(TrainSet$Sepal.Width)),
    sliderInput("Petal.Length", label = "Cold", value = 1.4,
                min = min(TrainSet$Petal.Length),
                max = max(TrainSet$Petal.Length)),
    sliderInput("Petal.Width", label = "Body Pain", value = 0.2,
                min = min(TrainSet$Petal.Width),
                max = max(TrainSet$Petal.Width)),

    actionButton("submitbutton", "Submit", class = "btn btn-primary")
  ),

  mainPanel(
    tags$label(h3('Status/Output')), # Status/Output Text Box
    verbatimTextOutput('contents'),
    tableOutput('tabledata') # Prediction results table

  )
)
