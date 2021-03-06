ui = navbarPage(title = 'IGAU Distribution',
                collapsible = T, 
                position = 'fixed-top',
                theme  = SMRD::add_theme(getShinyOption('theme')),
                header = SMRD::add_css(),
                footer = SMRD::add_logo(),

tabPanel('Shiny App',
         SMRD::add_ui('distribution_igau_functions')),

tabPanel('Distribution Functions',
         uiOutput('igaufunc', class = 'ta-text')),

tabPanel('Distribution Properties',
         uiOutput('igauprops', class = 'ta-text')))
