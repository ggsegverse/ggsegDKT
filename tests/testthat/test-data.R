describe("dkt atlas", {
  data(dkt, package = "ggsegDKT")

  it("is a valid ggseg_atlas", {
    expect_true(ggseg.formats::is_ggseg_atlas(dkt))
    expect_s3_class(dkt, "ggseg_atlas")
    expect_s3_class(dkt, "cortical_atlas")
  })

  it("has expected structure", {
    expect_identical(dkt$atlas, "dkt")
    expect_identical(dkt$type, "cortical")
    expect_true(!is.null(dkt$palette))
    expect_true(!is.null(dkt$core))
    expect_true(!is.null(dkt$data))
  })

  it("has 31 unique regions per hemisphere", {
    left <- dkt$core$region[dkt$core$hemi == "left" & !is.na(dkt$core$region)]
    right <- dkt$core$region[dkt$core$hemi == "right" & !is.na(dkt$core$region)]
    expect_equal(length(unique(left)), 31)
    expect_equal(length(unique(right)), 31)
  })

  it("has 2D geometry", {
    expect_true(!is.null(dkt$data$sf))
  })

  it("has 3D vertex data", {
    expect_true(!is.null(dkt$data$vertices))
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("ggplot2")
    p <- ggplot2::ggplot() + ggseg::geom_brain(atlas = dkt)
    expect_s3_class(p, c("gg", "ggplot"))
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg3d")
    p <- ggseg3d::ggseg3d(atlas = dkt)
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})
