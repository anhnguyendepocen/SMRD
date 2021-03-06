ui = navbarPage(title = 'Figure 1.3',
                collapsible = T, 
                position = 'fixed-top',
                theme  = SMRD::add_theme(getShinyOption('theme')),
                header = SMRD::add_css(),
                footer = SMRD::add_logo(),


tabPanel("Data Set", DT::dataTableOutput("lfp1370", height = "575px")),
                
tabPanel('Figure 1.3', titlePanel("Edit this code and press 'Evaluate' to change the figure"),
  sidebarLayout( 
    sidebarPanel(
      shinyAce::aceEditor("fig3plot", mode = "r", theme = "github", height = "450px", fontSize = 14,
                      value = "IC.ld<-frame.to.ld(frame = lfp1370,\nresponse.column = 1,\ncensor.column = 2,\ncase.weight.column = 3,\ndata.title = 'IC Failure Data',\ntime.units = 'Hours')\n\npar(family='serif',font=2,bg=NA)\n\nevent.plot(IC.ld)\n\n\n\n# event.plot( ) is part of the SMRD package\n\n# SMRD commands can only be performed on\n# 'life.data' objects\n\n# frame.to.ld( ) converts a 'data.frame'\n# to a 'life.data' object"),
              actionButton("evalfig3", 'Evaluate')),
        
        mainPanel(plotOutput("plotfig3")))))



