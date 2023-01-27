SELECT MIN(P.valor_plano) AS `faturamento_minimo`,
	  ROUND(MAX(P.valor_plano), 2) AS `faturamento_maximo`,
    ROUND(AVG(P.valor_plano), 2) AS `faturamento_medio`,
    ROUND(SUM(P.valor_plano), 2) AS `faturamento_total`
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.planos AS P
ON P.plano_id = U.plano_id;