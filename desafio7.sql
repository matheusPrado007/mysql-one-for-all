SELECT A.nm_artista AS `artista`,
	  P.nm_album AS `album`,
      COUNT(S.artista_id) AS `seguidores`
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.album AS P
  ON A.artista_id = P.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS S
ON S.artista_id = P.artista_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;