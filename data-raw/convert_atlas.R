#!/usr/bin/env Rscript
# Base conversion script for migrating legacy ggseg atlas packages
# to the unified ggseg_atlas format (ggseg ecosystem 2.0).
#
# Usage:
#   1. Clone the atlas repo and cd into it
#   2. Copy this script to data-raw/convert_atlas.R
#   3. Edit the CONFIGURATION block below
#   4. Run: Rscript data-raw/convert_atlas.R
#
# Prerequisites:
#   - ggseg.formats (>= 1.0.0) installed from ggseg/ggseg.formats
#   - Legacy data files present in data/

library(ggseg.formats)

# ── CONFIGURATION ─────────────────────────────────────────────────
atlas_name <- "dkt"
atlas_2d_name <- atlas_name      # name of 2D object in data/
atlas_3d_name <- paste0(atlas_name, "_3d") # name of 3D object in data/
# ──────────────────────────────────────────────────────────────────

cat("Converting", atlas_name, "to unified ggseg_atlas format\n")

# Load legacy objects
path_2d <- here::here("data", paste0(atlas_2d_name, ".rda"))
path_3d <- here::here("data", paste0(atlas_3d_name, ".rda"))

has_2d <- file.exists(path_2d)
has_3d <- file.exists(path_3d)

if (!has_2d && !has_3d) {
  stop("No legacy data found. Expected at least one of:\n",
       "  ", path_2d, "\n  ", path_3d)
}

if (has_2d) {
  load(path_2d)
  cat("  Loaded 2D:", atlas_2d_name, "\n")
}
if (has_3d) {
  load(path_3d)
  cat("  Loaded 3D:", atlas_3d_name, "\n")
}

atlas_2d_obj <- if (has_2d) get(atlas_2d_name) else NULL
atlas_3d_obj <- if (has_3d) get(atlas_3d_name) else NULL

# Convert
result <- convert_legacy_brain_atlas(
  atlas_2d = atlas_2d_obj,
  atlas_3d = atlas_3d_obj
)

print(result)
stopifnot(ggseg.formats::is_ggseg_atlas(result))

cat("\nCore rows:", nrow(result$core), "\n")
cat("Type:", class(result)[1], "\n")
cat("Has SF:", !is.null(result$data$sf), "\n")

has_3d_data <- !is.null(result$data$vertices) ||
  !is.null(result$data$meshes) ||
  !is.null(result$data$centerlines)
cat("Has 3D:", has_3d_data, "\n")

# Save unified object under the 2D name
assign(atlas_2d_name, result)
save(
  list = atlas_2d_name,
  file = here::here("data", paste0(atlas_2d_name, ".rda")),
  compress = "xz"
)
cat("\nSaved:", paste0("data/", atlas_2d_name, ".rda"), "\n")

# Remove old 3D file
if (has_3d && file.exists(path_3d)) {
  file.remove(path_3d)
  cat("Removed:", paste0("data/", atlas_3d_name, ".rda"), "\n")
}

# Generate internal palette data (sysdata.rda)
brain_pals <- stats::setNames(
  list(result$palette),
  result$atlas
)
save(brain_pals, file = here::here("R/sysdata.rda"), compress = "xz")
cat("Saved: R/sysdata.rda\n")

# Write atlas summary for PR body
summary_path <- here::here("data-raw", "atlas_summary.txt")
sink(summary_path)
cat("### ", atlas_2d_name, "\n\n```\n")
print(result)
cat("```\n\n")
cat("<details><summary>Core table</summary>\n\n```\n")
print(as.data.frame(result$core), right = FALSE)
cat("```\n\n</details>\n\n")
cat("<details><summary>Palette</summary>\n\n```\n")
print(result$palette)
cat("```\n\n</details>\n")
sink()
cat("\nAtlas summary written to:", summary_path, "\n")
cat("Paste this into the PR body under 'Atlas details'.\n")

cat("\nDone! Next steps:\n")
cat("  1. Update DESCRIPTION (version, deps, URLs)\n")
cat("  2. Rewrite R/ files (package.R + data.R)\n")
cat("  3. Rewrite tests (describe/it + vdiffr)\n")
cat("  4. Add _pkgdown.yml with ggseg branding\n")
cat("  5. Update GitHub Actions to r-lib/actions v2\n")
cat("  6. Update NEWS.md and README.Rmd\n")
cat("  7. Run devtools::document() && devtools::check()\n")
