CREATE DATABASE petshop;
USE petshop;

CREATE TABLE clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(13) NOT NULL,
    email VARCHAR(120) NOT NULL
);

CREATE TABLE pets(
    id INT AUTO_INCREMENT PRIMARY KEY,
    clientes_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especie ENUM('Felino', 'Canino', 'Anfíbio', 'Ave', 'Peixe') NOT NULL,
    porte ENUM('Grande', 'Médio', 'Pequeno') NOT NULL,
    CONSTRAINT fk_clientes_id FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);

CREATE TABLE servicos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL NOT NULL,
    duracao_min DECIMAL NOT NULL,
    CONSTRAINT preco CHECK (preco >= 0),
    CONSTRAINT duracao_min CHECK (duracao_min > 0)
);

CREATE TABLE agendamento(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pets_id INT NOT NULL,
    servicos_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status ENUM('Iniciado', 'Em progresso', 'Finalizado') NOT NULL,
    observacoes VARCHAR(100) NULL,
    CONSTRAINT fk_pets_id FOREIGN KEY (pets_id) REFERENCES pets(id),
    CONSTRAINT fk_servicos_id FOREIGN KEY (servicos_id) REFERENCES servicos(id)
);

INSERT INTO clientes(nome, cpf, telefone, email)

VALUES
('Roberto', '09204918401', '1247348309425', 'roberto@gmail.com.br'),
('Matheus', '02456781091', '1078356935174', 'matheus@gmail.com.br'),
('Carlos', '13256834061', '3783492049245', 'carlos@gmail.com.br');

INSERT INTO pets(nome, especie, porte)

VALUES
('Neve', 'Felino', 'Pequeno'),
('Brutos', 'Canino', 'Grande'),
('Arthur', 'Ave', 'Pequeno');

INSERT INTO servicos(nome, preco, duracao_min)

VALUES
('Tosa', '31,14', '2,30'),
('Vacina', '50,30', '1,50'),
('Banho', '20,30', '4,30');

INSERT INTO agendamento(data_hora, status)

VALUES
('2025-03-02 14:30:00', 'Iniciado'),
('2025-05-03 15:40:00', 'Em progresso'),
('2025-08-11 17:20:00', 'Finalizado');

