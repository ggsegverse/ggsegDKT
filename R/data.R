#' Desikan-Killiany-Tourville Cortical Atlas
#'
#' Brain atlas for the Desikan-Killiany-Tourville cortical parcellation
#' with 31 regions per hemisphere.
#' Contains both 2D polygon geometry for [ggseg::geom_brain()] and
#' 3D vertex indices for [ggseg3d::ggseg3d()].
#'
#' @docType data
#' @name dkt
#' @usage data(dkt)
#' @keywords datasets
#' @family ggseg_atlases
#'
#' @references Klein A, Tourville J (2012). "101 labeled brain images and a
#' consistent human cortical labeling protocol." *Frontiers in Neuroscience*,
#' 6:171. \doi{10.3389/fnins.2012.00171}
#'
#' @format A [ggseg.formats::ggseg_atlas] object (cortical).
#' @examples
#' data(dkt)
#' dkt
"dkt"
