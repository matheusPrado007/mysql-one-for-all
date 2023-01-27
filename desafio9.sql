SELECT COUNT(A.musicas_id) AS `quantidade_musicas_no_historico`
FROM SpotifyClone.historico_de_reproducoes AS A
INNER JOIN SpotifyClone.usuario AS P
  ON A.usuario_id = P.usuario_id
WHERE P.nm_usuario = 'Barbara Liskov';