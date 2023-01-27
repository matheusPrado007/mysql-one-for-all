SELECT M.nm_musica AS `cancao`,
	COUNT(A.musicas_id) AS `reproducoes`
FROM SpotifyClone.musicas AS M
    INNER JOIN SpotifyClone.historico_de_reproducoes AS A
    ON M.musicas_id = A.musicas_id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC, `cancao` ASC
    LIMIT 2;