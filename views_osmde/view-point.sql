DROP VIEW IF EXISTS planet_osm_point;
CREATE VIEW planet_osm_point AS
SELECT
osm_id,
tags->'access' as "access",
tags->'addr:housename' as "addr:housename",
tags->'addr:housenumber' as "addr:housenumber",
tags->'aerialway' as "aerialway",
tags->'aeroway' as "aeroway",
tags->'amenity' as "amenity",
tags->'barrier' as "barrier",
tags->'boundary' as "boundary",
tags->'building' as "building",
tags->'capital' as "capital",
tags->'denomination' as "denomination",
tags->'ele' as "ele",
osm_tag2num(tags->'ele') as "num_ele",
tags->'generator:source' as "generator:source",
tags->'highway' as "highway",
tags->'historic' as "historic",
tags->'junction' as "junction",
tags->'landuse' as "landuse",
tags->'leisure' as "leisure",
tags->'man_made' as "man_made",
tags->'military' as "military",
tags->'name' as "name",
tags->'name:de' as "name:de",
tags->'int_name' as "int_name",  
tags->'name:en' as "name:en",
tags->'natural' as "natural",
tags->'operator' as "operator",
tags->'place' as "place",
tags->'population' as "population",
tags->'power' as "power",
tags->'power_source' as "power_source",
tags->'railway' as "railway",
tags->'ref' as "ref",
tags->'religion' as "religion",
tags->'ruins' as "ruins",
tags->'service' as "service",
tags->'shop' as "shop",
tags->'sport' as "sport",
tags->'tourism' as "tourism",
tags->'waterway' as "waterway",
tags->'wetland' as "wetland",
osm_tag2num(tags->'width') as "num_width",
way as "way",
z_order as z_order,
osml10n_get_placename(tags->'name',tags->'name:de',tags->'int_name',tags->'name:en', true, way) as localized_name_inside_brackets,
osml10n_get_placename(tags->'name',tags->'name:de',tags->'int_name',tags->'name:en', false, way) as localized_name_outside_brackets,
osml10n_get_name_without_brackets(tags->'name',tags->'name:de',tags->'int_name',tags->'name:en', way) as localized_name_without_brackets,
osml10n_get_streetname(tags->'name',tags->'name:de',tags->'int_name',tags->'name:en', true, 'de', way) as localized_streetname_inside_brackets,
osml10n_get_streetname(tags->'name',tags->'name:de',tags->'int_name',tags->'name:en', false, 'de', way) as localized_streetname_outside_brackets,
tags as "tags"
FROM planet_osm_hstore_point;

GRANT select ON planet_osm_point TO public;
