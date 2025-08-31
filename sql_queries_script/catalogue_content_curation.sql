-- ============================================================
-- Catalogue & Content Curation — Chinook SQL Analytics
-- Purpose: Surface deep catalogs, identify curation gaps,
--          and quantify social proof via playlists
-- DB: SQLite (Chinook)
-- ============================================================

-- 1. Albums with deepest tracklists
SELECT al.AlbumId,
       al.Title AS Album,
       ar.Name  AS Artist,
       COUNT(t.TrackId) AS NumTracks
FROM albums al
JOIN artists ar ON ar.ArtistId = al.ArtistId
JOIN tracks  t  ON t.AlbumId   = al.AlbumId
GROUP BY al.AlbumId
ORDER BY NumTracks DESC, Album;

------------------------------------------------------------------

-- 2. Tracks missing from any playlist (curation gap)
SELECT t.TrackId, t.Name AS Track, ar.Name AS Artist
FROM tracks t
JOIN albums al  ON al.AlbumId  = t.AlbumId
JOIN artists ar ON ar.ArtistId = al.ArtistId
LEFT JOIN playlist_track pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId IS NULL
ORDER BY Artist, Track
LIMIT 50;

------------------------------------------------------------------

-- 3. Most playlisted tracks (social proof)
SELECT t.Name AS Track,
       ar.Name AS Artist,
       COUNT(pt.PlaylistId) AS PlaylistsCount
FROM playlist_track pt
JOIN tracks t  ON t.TrackId  = pt.TrackId
JOIN albums al ON al.AlbumId = t.AlbumId
JOIN artists ar ON ar.ArtistId = al.ArtistId
GROUP BY t.TrackId
ORDER BY PlaylistsCount DESC, Track

LIMIT 20;

