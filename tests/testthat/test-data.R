describe("dkt atlas", {
  it("loads as brain_atlas", {
    expect_s3_class(dkt(), "brain_atlas")
  })

  it("has cortical type", {
    expect_equal(dkt()$type, "cortical")
  })

  it("renders 2D plot", {
    skip("legacy brain_atlas — needs re-creation with ggsegExtra pipeline")
  })
})

describe("dkt_3d atlas", {
  it("loads as ggseg3d_atlas", {
    expect_s3_class(dkt_3d(), "ggseg3d_atlas")
  })

  it("renders with ggseg3d", {
    skip("legacy ggseg3d_atlas — needs re-creation with ggsegExtra pipeline")
  })
})
