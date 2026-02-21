#' Desikan-Killiany-Tourville Cortical Atlas
#'
#' Coordinate data for the Desikan-Killany-Tourville Cortical atlas,
#' with 31 regions in on the cortical surface of the brain.
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

#' Desikan-Killiany-Tourville 3D Atlas (Legacy)
#'
#' @inherit dkt references
#' @return A legacy ggseg3d atlas tibble.
#' @export
#' @family ggseg3d_atlases
#' @examples
#' dkt_3d()
dkt_3d <- function() .dkt_3d
