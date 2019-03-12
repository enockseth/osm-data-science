DROP TABLE IF EXISTS public.osm_nuts_counts;

CREATE TABLE public.osm_nuts_counts AS
  SELECT 
    amenity, nuts_id, COUNT(name) AS count
  FROM osm_amenities, osm_nuts
  WHERE osm_amenities.id = osm_nuts.osm_id
  GROUP BY amenity, nuts_id
