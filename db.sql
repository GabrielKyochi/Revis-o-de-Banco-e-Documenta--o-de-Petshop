CREATE DATABASE petshop;
USE petshop;

CREATE TABLE clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf INT UNIQUE NOT NULL,
    telefone INT NOT NULL,
    email VARCHAR(120) NOT NULL
);

CREATE TABLE pets(
    id INT AUTO_INCREMENT PRIMARY KEY,
    clientes_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especie ENUM('Felinos', 'Caninos', 'Anfíbios', 'Aves', 'Peixes'),
    porte ENUM('Grande', 'Médio', 'Pequeno'),
    CONSTRAINT fk_clientes_id FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);

CREATE TABLE servicos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL NOT NULL,
    duracao_min INT NOT NULL,
    CONSTRAINT preco CHECK (preco >= 0),
    CONSTRAINT duracao_min CHECK (duracao_min > 0)
);

CREATE TABLE agendamento(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pets_id INT NOT NULL,
    servicos_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status ENUM('Iniciado', 'Em progresso', 'Finalizado'),
    observacoes VARCHAR(100) NULL,
    CONSTRAINT fk_pets_id FOREIGN KEY (pets_id) REFERENCES pets(id),
    CONSTRAINT fk_servicos_id FOREIGN KEY (servicos_id) REFERENCES servicos(id)
);
