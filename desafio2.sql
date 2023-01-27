SELECT COUNT(DISTINCT M.musicas_id) AS `cancoes`,
	COUNT(DISTINCT AR.artista_id) AS `artistas`,
    COUNT(DISTINCT AL.album_id) AS `albuns`
FROM SpotifyClone.musicas AS M
    INNER JOIN SpotifyClone.artista AS AR
    INNER JOIN SpotifyClone.album AL;