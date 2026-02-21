devtools::load_all("../../ggsegExtra/")

dkt <- create_cortical_from_annotation(
  input_annot = c(
    "data-raw/lh.aparc.DKTatlas.annot",
    "data-raw/rh.aparc.DKTatlas.annot"
  ),
  atlas_name = "dkt",
  output_dir = "data-raw",
  cleanup = FALSE
)

.dkt <- dkt
usethis::use_data(.dkt, internal = TRUE, overwrite = TRUE, compress = "xz")
