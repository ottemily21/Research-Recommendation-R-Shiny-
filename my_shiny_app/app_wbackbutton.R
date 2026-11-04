
library(shiny)

# ============================================================
# SEDAR RESEARCH RECOMMENDATIONS APP
# Local folder structure:
# my_shiny_app/
#   app.R
#   www/
#     logos, species images, PDFs, and SE_map.png
# ============================================================

# -----------------------------
# Species-to-SEDAR mappings
# -----------------------------
council_data <- list(
  
  CFMC = list(
    title = "Caribbean Fishery Management Council",
    logo = "CFMC_logo.png",
    species_sedar = list(
      "Blue Tang" = "SEDAR30",
      "Data Limited Species" = "SEDAR46",
      "Mutton Snapper" = "SEDAR14",
      "Queen Conch" = "SEDAR14",
      "Queen Snapper" = "SEDAR26",
      "Queen Triggerfish" = c("SEDAR30", "SEDAR80"),
      "Red Hind" = "SEDAR35",
      "Redtail Parrotfish" = "SEDAR26",
      "Silk Snapper" = "SEDAR26",
      "Spiny Lobster" = c("SEDAR8", "SEDAR57", "SEDAR91"),
      "Yellowfin Grouper" = "SEDAR14",
      "Yellowtail Snapper" = c("SEDAR8", "SEDAR84"),
      "Stoplight Parrotfish" = "SEDAR84"
    )
  ),
  
  FWC = list(
    title = "Florida Fish and Wildlife Conservation Commission",
    logo = "FWC_logo.png",
    species_sedar = list(
      "Hogfish" = c("SEDAR37", "SEDAR94"),
      "Mutton Snapper" = "SEDAR79",
      "Yellowtail Snapper" = "SEDAR96"
     )
  ),
  SAFMC = list(
    title = "South Atlantic Fishery Management Council",
    logo = "SAFMC_logo.png",
    species_sedar = list(
      "Black Grouper" = c("SEDAR19", "SEDAR48"),
      "Black Sea Bass" = c("SEDAR2", "SEDAR25", "SEDAR56", "SEDAR76"),
      "Blueline Tilefish" = c("SEDAR32", "SEDAR50"),
      "Gag Grouper" = c("SEDAR10", "SEDAR71"),
      "Goliath Grouper" = c("SEDAR6", "SEDAR23", "SEDAR47"),
      "Gray Triggerfish" = c("SEDAR32", "SEDAR41"),
      "Greater Amberjack" = c("SEDAR15", "SEDAR59"),
      "Hogfish" = c("SEDAR6", "SEDAR37", "SEDAR94"),
      "King Mackerel" = c("SEDAR5", "SEDAR16", "SEDAR38", "SEDAR38U"),
      "Mutton Snapper" = c("SEDAR15A", "SEDAR79"),
      "Red Porgy" = c("SEDAR1", "SEDAR60"),
      "Red Grouper" = c("SEDAR19", "SEDAR53"),
      "Scamp Grouper" = c("SEDAR68ATL", "SEDAR68OAATL"),
      "Snowy Grouper" = c("SEDAR4", "SEDAR36", "SEDAR36U"),
      "Spanish Mackerel" = c("SEDAR17", "SEDAR28", "SEDAR78"),
      "Spiny Lobster" = "SEDAR8",
      "Golden Tilefish" = c("SEDAR4", "SEDAR25", "SEDAR66"),
      "Vermillion Snapper" = c("SEDAR2", "SEDAR17", "SEDAR55"),
      "Yellowtail Snapper" = c("SEDAR3", "SEDAR27A", "SEDAR64"),
      "Red Snapper" = c("SEDAR15", "SEDAR24", "SEDAR41", "SEDAR73"),
      "Cobia" = c("SEDAR28", "SEDAR58")
    )
  ),
  
  ASMFC = list(
    title = "Atlantic States Marine Fisheries Commission",
    logo = "ASMFC_logo.png",
    species_sedar = list(
      "Croaker" = c("SEDAR3", "SEDAR20"),
      "Menhaden" = c("SEDAR3", "SEDAR20", "SEDAR40", "SEDAR69", "SEDAR102"),
      "Red Drum" = c("SEDAR18", "SEDAR44")
    )
  ),
  
  GFMC = list(
    title = "Gulf Fishery Management Council",
    logo = "GFMC_logo.png",
    species_sedar = list(
      "Black Grouper" = c("SEDAR19", "SEDAR48"),
      "Cobia" = c("SEDAR28", "SEDAR28U"),
      "Data Limited Species" = "SEDAR49",
      "Gag Grouper" = c("SEDAR10", "SEDAR33", "SEDAR72"),
      "Goliath Grouper" = c("SEDAR6", "SEDAR23", "SEDAR47"),
      "Gray Snapper" = c("SEDAR51", "SEDAR75"),
      "Gray Triggerfish" = c("SEDAR9", "SEDAR43", "SEDAR100"),
      "Greater Amberjack" = c("SEDAR9", "SEDAR33", "SEDAR70"),
      "Hogfish" = c("SEDAR6", "SEDAR37", "SEDAR94"),
      "King Mackerel" = c("SEDAR5", "SEDAR16", "SEDAR38", "SEDAR38U"),
      "Mutton Snapper" = "SEDAR15A",
      "Red Grouper" = c("SEDAR12", "SEDAR42", "SEDAR61"),
      "Red Snapper" = c("SEDAR7", "SEDAR31", "SEDAR52", "SEDAR98"),
      "Scamp Grouper" = c("SEDAR68GLF", "SEDAR68OAGLF"),
      "Spanish Mackerel" = "SEDAR28",
      "Spiny Lobster" = "SEDAR8",
      "Golden Tilefish" = "SEDAR22",
      "Vermillion Snapper" = c("SEDAR9", "SEDAR45", "SEDAR67"),
      "Yellowedge Grouper" = "SEDAR22",
      "Yellowtail Snapper" = c("SEDAR3", "SEDAR27A", "SEDAR64")
    )
  ),
  
  GSMFC = list(
    title = "Gulf States Marine Fisheries Commission",
    logo = "GSMFC_logo.png",
    species_sedar = list(
      "Menhaden" = c("SEDAR27", "SEDAR97")
    ),
    extra_sedar = list(
      "Menhaden" = c("SEDAR32A", "SEDAR63")
    )
  ),
  
  HMS = list(
    title = "Highly Migratory Species",
    logo = "HMS_logo.png",
    species_sedar = list(
      "Sharpnose Shark" = "SEDAR34",
      "Blacknose Shark" = "SEDAR21",
      "Blacktip Shark" = c("SEDAR11", "SEDAR29", "SEDAR65"),
      "Bonnethead Shark" = "SEDAR34",
      "Dusky Shark" = "SEDAR21",
      "Large Coastal Sharks" = "SEDAR11",
      "Sandbar Shark" = c("SEDAR11", "SEDAR21", "SEDAR54"),
      "Small Coastal Sharks" = "SEDAR13",
      "Smoothhound Shark" = "SEDAR39"
    )
  )
)

# -----------------------------
# Helper: obtain all SEDAR numbers
# -----------------------------
get_sedars <- function(council, species) {
  primary <- council_data[[council]]$species_sedar[[species]]
  
  extra <- council_data[[council]]$extra_sedar
  additional <- if (!is.null(extra)) extra[[species]] else NULL
  
  unique(c(primary, additional))
}

# -----------------------------
# User interface
# -----------------------------
ui <- fluidPage(
  
  titlePanel("SEDAR Assessment's Research Recommendations"),
  
  tags$p(
    tags$a(
      href = "consol_rr_10.17.2025.pdf",
      "Click here for all SEDAR research recommendations",
      target = "_blank",
      style = paste(
        "font-size:16px;",
        "font-weight:500;",
        "color:#007BFF;",
        "text-decoration:none;"
      )
    ),
    style = "margin-bottom:20px; text-align:left;"
  ),
  
  tags$p(
    "For further details on the assessments please email Emily.Ott@safmc.net",
    style = "font-size:14px; color:#555; margin-bottom:20px;"
  ),
  
  tags$head(
    tags$style(HTML("
      .fish-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
        gap: 15px;
      }

      .fish-button, .council-button {
        border: none;
        background-color: #f8f9fa;
        border-radius: 12px;
        padding: 5px;
        margin: 5px;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
        cursor: pointer;
      }

      .fish-button:hover, .council-button:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
      }

      .fish-button img, .council-button img {
        width: 100%;
        height: 80px;
        object-fit: contain;
        border-radius: 8px;
      }

      .fish-label {
        text-align: center;
        margin-top: 5px;
        font-weight: 600;
        font-size: 13px;
      }
    "))
  ),
  
  sidebarLayout(
    sidebarPanel(
      uiOutput("dynamic_sidebar"),
      width = 3
    ),
    
    mainPanel(
      uiOutput("dynamic_main"),
      width = 9
    )
  )
)

# -----------------------------
# Server
# -----------------------------
server <- function(input, output, session) {
  
  # Shiny automatically serves files from the www folder.
  # Do not use addResourcePath() or a GitHub URL here.
  
  current_council <- reactiveVal(NULL)
  current_species <- reactiveVal(NULL)
  current_sedar <- reactiveVal(NULL)
  
  # ---------------------------
  # Sidebar
  # ---------------------------
  output$dynamic_sidebar <- renderUI({
    
    if (is.null(current_council())) {
      
      tagList(
        h4("Select a Council / Species Group"),
        
        div(
          class = "fish-grid",
          
          lapply(names(council_data), function(cn) {
            actionButton(
              inputId = paste0("council_", cn),
              
              label = div(
                tags$img(
                  src = council_data[[cn]]$logo,
                  alt = cn
                ),
                div(class = "fish-label", cn)
              ),
              
              class = "council-button"
            )
          })
        )
      )
      
    } else if (is.null(current_species())) {
      
      sp_sedar <- council_data[[current_council()]]$species_sedar
      
      tagList(
        actionButton(
          "back_main",
          "Back",
          class = "btn btn-secondary",
          width = "100%"
        ),
        
        br(), br(),
        
        h4("Select a Species"),
        
        div(
          class = "fish-grid",
          
          lapply(names(sp_sedar), function(sp) {
            
            species_image <- paste0(
              gsub(" ", "_", sp),
              ".png"
            )
            
            actionButton(
              inputId = paste0(
                "species_",
                gsub(" ", "_", sp)
              ),
              
              label = div(
                tags$img(
                  src = species_image,
                  alt = sp,
                  onerror = "this.style.display='none';"
                ),
                div(class = "fish-label", sp)
              ),
              
              class = "fish-button"
            )
          })
        )
      )
      
    } else {
      
      sp <- current_species()
      
      sedars <- get_sedars(current_council(), sp)
      sedars <- sedars[!is.na(sedars) & nzchar(sedars)]
      
      tagList(
        actionButton(
          "back_species",
          "Back",
          class = "btn btn-secondary",
          width = "100%"
        ),
        
        br(), br(),
        
        h4(paste("SEDAR Documents for", sp)),
        
        lapply(sedars, function(sd) {
          actionButton(
            inputId = paste0("sedar_", sd),
            label = sd,
            width = "100%"
          )
        })
      )
    }
  })
  
  # ---------------------------
  # Back buttons
  # ---------------------------
  observeEvent(input$back_main, {
    current_council(NULL)
    current_species(NULL)
    current_sedar(NULL)
  })
  
  observeEvent(input$back_species, {
    current_species(NULL)
    current_sedar(NULL)
  })
  
  # ---------------------------
  # Council selection
  # ---------------------------
  lapply(names(council_data), function(cn) {
    
    observeEvent(input[[paste0("council_", cn)]], {
      current_council(cn)
      current_species(NULL)
      current_sedar(NULL)
    }, ignoreInit = TRUE)
    
  })
  
  # ---------------------------
  # Species selection
  # Create one observer per unique species.
  # ---------------------------
  all_species <- unique(unlist(
    lapply(council_data, function(x) names(x$species_sedar))
  ))
  
  lapply(all_species, function(sp) {
    
    observeEvent(
      input[[paste0("species_", gsub(" ", "_", sp))]],
      
      {
        req(current_council())
        
        available_species <- names(
          council_data[[current_council()]]$species_sedar
        )
        
        if (sp %in% available_species) {
          current_species(sp)
          current_sedar(NULL)
        }
      },
      
      ignoreInit = TRUE
    )
    
  })
  
  # ---------------------------
  # SEDAR document selection
  # ---------------------------
  all_sedars <- unique(unlist(
    lapply(names(council_data), function(cn) {
      
      primary <- unlist(council_data[[cn]]$species_sedar)
      
      extra <- council_data[[cn]]$extra_sedar
      additional <- if (!is.null(extra)) unlist(extra) else NULL
      
      c(primary, additional)
    })
  ))
  
  all_sedars <- all_sedars[
    !is.na(all_sedars) & nzchar(all_sedars)
  ]
  
  lapply(all_sedars, function(sd) {
    
    observeEvent(input[[paste0("sedar_", sd)]], {
      
      req(current_council(), current_species())
      
      valid_sedars <- get_sedars(
        current_council(),
        current_species()
      )
      
      if (sd %in% valid_sedars) {
        current_sedar(sd)
      }
      
    }, ignoreInit = TRUE)
    
  })
  
  # ---------------------------
  # Open selected SEDAR PDF
  # ---------------------------
  observeEvent(current_sedar(), {
    
    req(current_sedar(), current_species())
    
    pdf_file <- paste0(
      "res_rec_",
      current_sedar(),
      ".pdf"
    )
    
    showModal(
      modalDialog(
        title = paste(
          current_species(),
          "-",
          current_sedar(),
          "Resource Record"
        ),
        
        tags$iframe(
          src = pdf_file,
          style = paste(
            "width:100%;",
            "height:600px;",
            "border:none;"
          )
        ),
        
        easyClose = TRUE,
        footer = NULL,
        size = "l"
      )
    )
    
  }, ignoreInit = TRUE)
  
  # ---------------------------
  # Main panel
  # ---------------------------
  output$dynamic_main <- renderUI({
    
    if (is.null(current_council())) {
      
      fluidRow(
        h3("Click a cooperator to view its species list."),
        
        tags$img(
          src = "SE_map.png",
          style = "width:100%;"
        )
      )
      
    } else if (is.null(current_species())) {
      
      fluidRow(
        h3(
          paste(
            "Welcome to the",
            council_data[[current_council()]]$title,
            "Dashboard"
          )
        ),
        
        p("Select a species on the left to view its research recommendations."),
        
        tags$img(
          src = council_data[[current_council()]]$logo,
          style = "width:45%;",
          alt = current_council()
        )
      )
      
    } else if (is.null(current_sedar())) {
      
      fluidRow(
        h3(current_species()),
        
        p("Choose a SEDAR report from the sidebar to view the PDF.")
      )
      
    } else {
      
      fluidRow(
        h3(
          paste(
            current_species(),
            "-",
            current_sedar()
          )
        ),
        
        p("The corresponding SEDAR report has opened in a pop-up window.")
      )
    }
  })
}

# -----------------------------
# Launch application
# -----------------------------
shinyApp(ui = ui, server = server)
