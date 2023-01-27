SELECT A.nm_artista AS `artista`,
	  P.nm_album AS `album`
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.album AS P
  ON A.artista_id = P.artista_id
WHERE A.nm_artista = 'Elis Regina';