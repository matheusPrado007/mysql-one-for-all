SELECT DISTINCT U.nm_usuario AS `usuario`,
	IF(YEAR(MAX(A.datas)) > 2020,
    'Usuário ativo', 'Usuário inativo') AS status_usuario
    FROM SpotifyClone.usuario AS U
    INNER JOIN SpotifyClone.historico_de_reproducoes AS A
    ON U.usuario_id = A.usuario_id
    GROUP BY U.nm_usuario
    ORDER BY U.nm_usuario;