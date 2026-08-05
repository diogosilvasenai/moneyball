-- ============================================================
-- Script de criação do banco de dados - BRMW
-- Baseado no Modelo Lógico (Primeira migração)
-- ============================================================

DROP DATABASE IF EXISTS brmw;
CREATE DATABASE brmw
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE brmw;

-- ------------------------------------------------------------
-- Tabela: USUARIOS
-- ------------------------------------------------------------
CREATE TABLE USUARIOS (
    id_usuario   INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    email        VARCHAR(150) NOT NULL UNIQUE,
    senha_hash   VARCHAR(255) NOT NULL,
    criado_em    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- Tabela: CLUBES
-- ------------------------------------------------------------
CREATE TABLE CLUBES (
    id_clube     INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(120) NOT NULL,
    cidade       VARCHAR(100),
    criado_em    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- Tabela: TEMPORADAS
-- ------------------------------------------------------------
CREATE TABLE TEMPORADAS (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    data_inicio  DATE,
    data_fim     DATE,
    status       VARCHAR(30)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- Tabela: JOGADORES
-- Relacionamento 1:N (USUARIOS -> JOGADORES) via id_usuario
-- ------------------------------------------------------------
CREATE TABLE JOGADORES (
    id_jogador       INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario       INT NOT NULL,
    nome             VARCHAR(120) NOT NULL,
    data_nascimento  DATE,
    posicao          VARCHAR(50),
    criado_em        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_jogadores_usuario
        FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- Tabela: ESTATISTICAS
-- Relacionamento 1:N (JOGADORES -> ESTATISTICAS) via id_jogador
-- ------------------------------------------------------------
CREATE TABLE ESTATISTICAS (
    id_estatistica     INT AUTO_INCREMENT PRIMARY KEY,
    id_jogador         INT NOT NULL,
    jogos              INT DEFAULT 0,
    gols               INT DEFAULT 0,
    assistencias       INT DEFAULT 0,
    cartoes_amarelos   INT DEFAULT 0,
    cartoes_vermelhos  INT DEFAULT 0,
    atualizado_em      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_estatisticas_jogador
        FOREIGN KEY (id_jogador) REFERENCES JOGADORES(id_jogador)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
-- Tabela: PARTIDAS
-- Relacionamento 1:N (TEMPORADAS -> PARTIDAS) via id_temporada
-- Relacionamento N:1 (PARTIDAS -> CLUBES) via id_time_mandante e id_time_visitante
-- ------------------------------------------------------------
CREATE TABLE PARTIDAS (
    id_partida         INT AUTO_INCREMENT PRIMARY KEY,
    id_temporada       INT NOT NULL,
    id_time_mandante   INT NOT NULL,
    id_time_visitante  INT NOT NULL,
    data_partida       TIMESTAMP,
    campeonato         VARCHAR(120),
    gols_mandante      INT DEFAULT 0,
    gols_visitante     INT DEFAULT 0,
    status             VARCHAR(30),
    CONSTRAINT fk_partidas_temporada
        FOREIGN KEY (id_temporada) REFERENCES TEMPORADAS(id_temporada)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_partidas_time_mandante
        FOREIGN KEY (id_time_mandante) REFERENCES CLUBES(id_clube)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_partidas_time_visitante
        FOREIGN KEY (id_time_visitante) REFERENCES CLUBES(id_clube)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_times_diferentes
        CHECK (id_time_mandante <> id_time_visitante)
) ENGINE=InnoDB;

-- ============================================================
-- Fim do script
-- ============================================================
