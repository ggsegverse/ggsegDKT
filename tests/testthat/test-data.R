# ggseg ----

library(ggseg, quietly = TRUE, warn.conflicts = FALSE)
library(ggseg3d, quietly = TRUE, warn.conflicts = FALSE)
library(ggplot2, quietly = TRUE, warn.conflicts = FALSE)

context("test-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("dkt", package = "ggsegDKT")), 31)

  expect_error(brain_pal("dkt"), "not a valid")

  expect_true(all(names(brain_pal("dkt", package = "ggsegDKT")) %in% brain_regions(dkt)))
})

context("test-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_brain_atlas(dkt))

})

context("test-ggseg")
test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = dkt()),c("gg","ggplot"))

  expect_is(ggseg(atlas = dkt(), mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = dkt(), mapping = aes(fill = region)) +
              scale_fill_brain("dkt", package = "ggsegDKT"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = dkt(), mapping = aes(fill = region)) +
              scale_fill_brain("dkt", package = "ggsegDKT"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = dkt(), mapping=aes(fill=area),
                  position="stacked"), c("gg","ggplot"))

  expect_is(ggseg(atlas = dkt(), mapping=aes(fill=area), adapt_scales = F ),c("gg","ggplot"))

})


# ggseg3d ----
context("test-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas = dkt_3d()),
    c("plotly", "htmlwidget")
  )
})



context("test-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(dkt_3d))

})
