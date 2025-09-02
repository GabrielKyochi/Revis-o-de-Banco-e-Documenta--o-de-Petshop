CREATE DATABASE petshop;
USE petshop;

CREATE TABLE cliente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf INT UNIQUE NOT NULL,
    telefone INT NOT NULL,
    email VARCHAR(120) NOT NULL
);

CREATE TABLE pet(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especie ENUM('Felinos', 'Caninos', 'Anfíbios', 'Aves', 'Peixes'),
    porte ENUM('Grande', 'Médio', 'Pequeno'),
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE servico(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL NOT NULL,
    duracao_min INT NOT NULL,
    CONSTRAINT preco CHECK (preco >= 0),
    CONSTRAINT duracao_min CHECK (duracao_min > 0)
);

CREATE TABLE agendamento(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status ENUM('Iniciado', 'Em progresso', 'Finalizado'),
    observacoes VARCHAR(100) NULL,
    CONSTRAINT fk_pet_id FOREIGN KEY (pet_id) REFERENCES pet(id),
    CONSTRAINT fk_servico_id FOREIGN KEY (servico_id) REFERENCES servico(id)
);