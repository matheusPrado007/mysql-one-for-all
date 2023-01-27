SELECT U.nm_usuario AS `usuario`,
	COUNT(DISTINCT H.musicas_id) AS `qt_de_musicas_ouvidas`,
    SUM(ROUND((AL.duracao / 60), 2)) AS `total_minutos`
FROM SpotifyClone.usuario AS U
    INNER JOIN SpotifyClone.historico_de_reproducoes AS H
    ON U.usuario_id = H.usuario_id
    INNER JOIN SpotifyClone.musicas AL
    ON AL.musicas_id = H.musicas_id
    GROUP BY U.usuario_id
    ORDER BY U.nm_usuario;