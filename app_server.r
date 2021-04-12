select(members) %>%
  group_by(state,gender) %>%
  mutate("F" = TRUE)%>%
summarise(female = sum(n))

  server <- function(input, output) {
    output$plot1 <- renderPlot({
      categories <- input$state
      categories[length(categories) + 1] <- "All States"
      plotdf <- df[match(categories, df$state), ]
      
      ggplot() + geom_bar(aes(y = female, x = "female",
                              fill = as.double(total)),
                          data = plotdf, stat = "identity")+
        labs(x = "Gender", y = "Count",
             fill = "Total Members in the House") +
        ggtitle("Comparison of Gender of House Reps by State")
    })
  }

