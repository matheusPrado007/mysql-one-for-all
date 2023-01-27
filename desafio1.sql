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
      FOREIGN KEY (album_id) REFERENCES album (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_de_reproducoes(
      musicas_id INT NOT NULL,
      usuario_id INT NOT NULL,
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
    ('Bell Hooks', 2, 7),
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

  INSERT INTO SpotifyClone.musicas (nm_musica, album_id)
  VALUES
    ('BREAK MY SOUL', 1),
    ("VIRGO'S GROOVE", 1),
    ('ALIEN SUPERSTAR', 1),
    ("Don't Stop Me Now", 2),
    ('Under Pressure', 3),
    ('Como Nossos Pais', 4),
    ('O Medo de Amar é o Medo de Ser Livre', 5),
    ('Samba em Paris', 6),
    ("The Bard's Song", 7),
    ('Feeling Good', 8);

  INSERT INTO SpotifyClone.historico_de_reproducoes (musicas_id, usuario_id)
  VALUES
    (8, 1),
    (2, 1),
    (10, 1),
    (10, 2),
    (7, 2),
    (10, 3),
    (2, 3),
    (8, 4),
    (8, 5),
    (5, 5),
    (7, 6),
    (1, 6),
    (1, 7),
    (4, 8),
    (9, 9),
    (3, 10);

  




