#' Desikan-Killiany-Tourville Cortical Atlas
#'
#' Cortical parcellation with 32 regions per hemisphere based on the
#' Desikan-Killiany-Tourville labeling protocol. Contains both 2D
#' polygon geometry for [ggseg::geom_brain()] and 3D vertex indices
#' for [ggseg3d::ggseg3d()].
#'
#' @family ggseg_atlases
#'
#' @references Klein A, Tourville J (2012).
#'   101 labeled brain images and a consistent human cortical labeling protocol.
#'   *Frontiers in Neuroscience*, 6:171.
#'   \doi{10.3389/fnins.2012.00171}
#'
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @import ggseg.formats
#' @export
#' @examples
#' dkt()
dkt <- function() .dkt
