library(ggplot2)
library(dplyr)
library(forcats)
library(readr)
library(statR)
library(here)

ghe_repos <- readr::read_csv(
  "https://raw.githubusercontent.com/Global-Health-Engineering/ghedata-code/main/github/clean-data/github_repos_public.csv",
  show_col_types = FALSE
)

p <- ghe_repos |>
  dplyr::mutate(
    license = dplyr::case_when(
      is.na(license) ~ "No license",
      license == "Creative Commons Attribution 4.0 International" ~ "CC-BY-4.0",
      license == "Creative Commons Attribution Share Alike 4.0 International" ~ "CC-BY-SA-4.0",
      license == "MIT License" ~ "MIT",
      license == "Apache License 2.0" ~ "Apache-2.0",
      license == "GNU General Public License v3.0" ~ "GPL-3.0",
      license == "CERN Open Hardware Licence Version 2 - Permissive" ~ "CERN-OHL-P-2.0",
      license == "CERN Open Hardware Licence Version 2 - Strongly Reciprocal" ~ "CERN-OHL-S-2.0",
      TRUE ~ license
    )
  ) |>
  dplyr::count(created_year, license) |>
  dplyr::mutate(license = forcats::fct_reorder(license, n, .fun = sum)) |>
  ggplot(aes(x = factor(created_year), y = n, fill = license)) +
  geom_col() +
  geom_text(aes(label = n),
            position = position_stack(vjust = 0.5),
            color = "grey20",
            fontface = "bold",
            size = 2) +
  labs(
    title = "Public GitHub repositories at Global Health Engineering",
    subtitle = "Growth by year created, coloured by license",
    x = NULL,
    y = "Number of public repositories",
    fill = "License:"
  ) +
  scale_fill_brewer(palette = "Set3", na.value = "grey60") +
  guides(fill = guide_legend(nrow = 1, reverse = TRUE)) +
  statR::theme_stat(base_size = 13) +
  theme(
    panel.grid.major.x = element_blank(),
    axis.text.x = element_text(size = 13),
    legend.position = "bottom",
    legend.text = element_text(size = 10),
    legend.title = element_text(size = 10),
    legend.key.size = grid::unit(0.8, "lines"),
    plot.margin = ggplot2::margin(2, 8, 2, 2)
  )

ggsave(
  filename = here::here("slides", "img", "fig-ghe-github-repos-by-license.png"),
  plot = p,
  width = 1200 / 150,
  height = 627 / 150,
  dpi = 150,
  units = "in",
  bg = "white"
)
