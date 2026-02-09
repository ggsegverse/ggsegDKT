library(ggseg.formats)

load(here::here("data/dkt.rda"))
load(here::here("data/dkt_3d.rda"))

dkt <- convert_legacy_brain_atlas(
  atlas_2d = dkt,
  atlas_3d = dkt_3d
)

print(dkt)
stopifnot(ggseg.formats::is_ggseg_atlas(dkt))

save(dkt, file = here::here("data/dkt.rda"), compress = "xz")
file.remove(here::here("data/dkt_3d.rda"))
