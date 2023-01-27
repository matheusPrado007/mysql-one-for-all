SELECT M.nm_musica AS `nome`,
	 COUNT(H.musicas_id) AS `reproducoes`
FROM SpotifyClone.usuario AS A
INNER JOIN SpotifyClone.historico_de_reproducoes AS H
  ON A.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.musicas AS M
ON H.musicas_id = M.musicas_id
WHERE A.plano_id = 1
OR A.plano_id = 4
GROUP BY `nome`
ORDER BY `nome`;