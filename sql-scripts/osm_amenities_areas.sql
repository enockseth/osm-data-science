-- SELECT country_code, admin_level, name 
-- FROM osm_boundaries 
-- WHERE admin_level = '4' LIMIT 20

--SELECT a.name, a.amenity, b.name, ST_AsText(a.coordinates)::geometry AS geom
--FROM osm_amenities a, osm_boundaries b
--WHERE a.amenity = 'pub' AND b.name = 'Salzburg' AND ST_Within(a.coordinates::geometry, b.multipolygon::geometry)

--SELECT * FROM salzburg_pubs

DROP VIEW IF EXISTS public.salzburg_pubs;
DROP VIEW IF EXISTS public.osm_amenities_areas;

--CREATE OR REPLACE VIEW public.osm_amenities_areas AS 
CREATE TABLE public.osm_amenities_areas AS
 SELECT DISTINCT a.osm_id,
    a.name,
    a.amenity,
    a.type,
    b.name AS area_name,
    b.osm_id AS area_osm_id, 
    st_makevalid(a.coordinates::geometry)::geometry AS point
   FROM osm_amenities a,
    osm_boundaries b
  WHERE b.admin_level = 4
    AND st_within(a.coordinates::geometry, b.multipolygon::geometry);

ALTER TABLE public.osm_amenities_areas
  OWNER TO postgres;

--SELECT * FROM salzburg_pubs;