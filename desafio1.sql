DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.idades(
      idade_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      idade VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.planos(
      plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      plano VARCHAR(50) NOT NULL,
      valor_plano DECIMAL(4, 2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nm_usuario VARCHAR(50) NOT NULL,
      plano_id INT NOT NULL,
      idade_id INT NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos (plano_id),
       FOREIGN KEY (idade_id) REFERENCES SpotifyClone.idades (idade_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nm_artista VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artistas(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);

  CREATE TABLE SpotifyClone.album(
      album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nm_album VARCHAR(50) NOT NULL,
      ano_lancamento INT NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musicas(
      musicas_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nm_musica VARCHAR(50) NOT NULL,
      album_id INT NOT NULL,
      duracao INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES album (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_de_reproducoes(
      musicas_id INT NOT NULL,
      usuario_id INT NOT NULL,
      datas DATE NOT NULL,
      CONSTRAINT PRIMARY KEY(usuario_id, musicas_id),
      FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario (usuario_id),
      FOREIGN KEY (musicas_id) REFERENCES SpotifyClone.musicas (musicas_id)
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.idades (idade)
  VALUES
    (82),
    (58),
    (37),
    (46),
    (58),
    (19),
    (26),
    (85),
    (45),
    (58);

  INSERT INTO SpotifyClone.planos (plano, valor_plano)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.999),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.usuario (nm_usuario, plano_id, idade_id)
  VALUES
    ('Barbara Liskov', 1, 1),
    ('Robert Cecil Martin', 1, 2),
    ('Ada Lovelace', 4, 3),
    ('Martin Fowler', 4, 4),
    ('Sandi Metz', 4,5),
    ('Paulo Freire', 2, 6),
    ('Bell Hooks', 3, 7),
    ('Christopher Alexander', 3, 8),
    ('Judith Butler', 3, 9),
    ('Jorge Amado', 3, 10);

  INSERT INTO SpotifyClone.artista (nm_artista, artista_id)
   VALUES
    ('Beyoncé', 1),
    ('Queen', 2),
    ('Elis Regina', 3),
    ('Baco Exu do Blues', 4),
    ('Blind Guardian', 5),
    ('Nina Simone', 6);

  INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);

  INSERT INTO SpotifyClone.album (nm_album, ano_lancamento, artista_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante',1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.musicas (nm_musica, album_id, duracao)
  VALUES
    ('BREAK MY SOUL', 1, 279),
    ("VIRGO'S GROOVE", 1, 369),
    ('ALIEN SUPERSTAR', 1, 116),
    ("Don't Stop Me Now", 2, 203),
    ('Under Pressure', 3, 152),
    ('Como Nossos Pais', 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
    ('Samba em Paris', 6, 267),
    ("The Bard's Song", 7, 244),
    ('Feeling Good', 8, 100);

  INSERT INTO SpotifyClone.historico_de_reproducoes (musicas_id, usuario_id, datas)
  VALUES
    (8, 1, '2022-02-28 10:45:55'),
    (2, 1, '2020-05-02 05:30:35'),
    (10, 1, '2020-03-06 11:22:33'),
    (10, 2, '2022-08-05 08:05:17'),
    (7, 2, '2020-01-02 07:40:33'),
    (10, 3, '2020-11-13 16:55:13'),
    (2, 3, '2020-12-05 18:38:30'),
    (8, 4, '2021-08-15 17:10:10'),
    (8, 5, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (7, 6, '2017-01-24 00:31:17'),
    (1, 6, '2017-10-12 12:35:20'),
    (4, 7, '2011-12-15 22:30:49'),
    (4, 8, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (3, 10, '2015-12-13 08:30:22');

  




