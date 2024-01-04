data <- fread("data/clean-data/owid-data.tsv")



data_m <- melt(
  data, 
  id.vars = c("location", "GBDR7"), 
  measure.vars = non_correlated_indices, 
  value.factor = FALSE, 
  variable.factor = FALSE
)
data_mean <- data_m[, .(
  mean = signif(mean(value), 2), 
  sd = signif(sd(value), 2)
), by = variable]
data_mean[, facet_header := paste0(variable, ", mean=", mean, " SD=", sd)]
data_mean[,
          .(index = variable, mean, sd)
]

p <- ggplot(
  data_m, 
  aes(
    x =  value, 
    fill = variable
  )
) +
  facet_wrap(
    ~variable,
    scales = "free_x",
    labeller = labeller(
      variable = structure(
        data_mean$facet_header, 
        names = data_mean$variable
      )
    ),
    ncol = 1) +
  geom_vline(
    data = data_mean,
    aes(
      xintercept = mean, 
      color = variable)
  ) +
  geom_histogram() +
  ylab(NULL) +
  xlab("Index Value") +
  guides( 
    fill = guide_legend(title = NULL),
    color = "none"
  ) +
  theme(legend.position = "bottom")
p

ggsave(p, 
       filename = "index_distribution_mean.tiff",
       path = "paper/figures/",
       device = "tiff", 
       width = 4, 
       height = 12, 
       dpi = 150)