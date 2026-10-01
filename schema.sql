-- Estrutura do Banco de Dados — Rota Inteligente

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL,
    restricao_horario VARCHAR(50),
    restricao_veiculo VARCHAR(50)
);

CREATE TABLE veiculos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(50) NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    capacidade_m3 DECIMAL(10,2) NOT NULL,
    capacidade_kg DECIMAL(10,2) NOT NULL,
    status ENUM('disponivel', 'em_rota', 'manutencao') DEFAULT 'disponivel'
);

CREATE TABLE motoristas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cnh VARCHAR(20) NOT NULL
);

CREATE TABLE entregas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero_nf VARCHAR(20) UNIQUE NOT NULL,
    cliente_id INT NOT NULL,
    volume_m3 DECIMAL(10,2) NOT NULL,
    peso_kg DECIMAL(10,2) NOT NULL,
    status ENUM('pendente', 'em_transito', 'entregue', 'falha') DEFAULT 'pendente',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE rotas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    veiculo_id INT NOT NULL,
    motorista_id INT NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('planejada', 'em_andamento', 'concluida') DEFAULT 'planejada',
    FOREIGN KEY (veiculo_id) REFERENCES veiculos(id),
    FOREIGN KEY (motorista_id) REFERENCES motoristas(id)
);
