DROP TABLE IF EXISTS public.osm_nuts;

CREATE TABLE public.osm_nuts AS
  SELECT DISTINCT 
    a.id as osm_id,
    b.nuts_id AS nuts_id
  FROM osm_amenities a, nuts b
  WHERE st_within(a.geom::geometry, b.wkb_geometry::geometry);

--ALTER TABLE public.osm_nuts_2013
  --ADD CONSTRAINT osm_id_fkey 
  --FOREIGN KEY (osm_id) 
  --REFERENCES osm_amenities (id);

--ALTER TABLE public.osm_nuts_2013
  --ADD CONSTRAINT nuts_2013_id_fkey 
  --FOREIGN KEY (nuts_ogc_fid) 
  --REFERENCES nuts_2013 (ogc_fid);
