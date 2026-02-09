# ggsegDKT 2.0.0

## Breaking changes

* `dkt` is now a `ggseg_atlas` object (from ggseg.formats) containing both 2D
  and 3D data. The separate `dkt_3d` object has been removed.

* Use `ggseg::ggseg(atlas = dkt)` for 2D plots and
  `ggseg3d::ggseg3d(atlas = dkt)` for 3D plots — both from the same object.

* `ggseg.formats` is now a hard dependency (in Depends).

* Package URLs updated from `LCBC-UiO` to `ggseg` GitHub organisation.
