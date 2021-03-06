ui = fluidPage(theme = SMRD::add_theme(getShinyOption("theme")), 
               SMRD::add_css(),
               
sidebarLayout(
   sidebarPanel(width = 5,
      shinyAce::aceEditor(fontSize = 16, 
                          wordWrap = T,
                          outputId = "shocksurf", 
                          mode = "r", 
                          theme = "github", 
                          height = "450px", 
                          value = "
par(mfrow = c(1,2), las = 1)

library(SMRD)

zoom <- 1.5
threeD <- F

Shock.ld <- 
frame.to.ld(shockabsorber,
            response.column = 1, 
            censor.column = 3,
            time.units = 'Kilometers')

simple.contour(Shock.ld, 
               distribution = 'weibull', 
               show.confidence = T, 
               zoom.level = zoom,
               original.par = F,
               threeD = threeD)

simple.contour(Shock.ld, 
               distribution = 'weibull', 
               show.confidence = F, 
               zoom.level = zoom,
               threeD = threeD)

par(mfrow = c(1,1))"),
             
        actionButton("shocksurfs", "Evaluate")),
        
        mainPanel(plotOutput("shurf"), width = 7)))
