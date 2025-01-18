-- Tabela Pacientes
CREATE TABLE pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255) NOT NULL
);

-- Tabela Médicos
CREATE TABLE medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(15) UNIQUE NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);

-- Tabela Consultas
CREATE TABLE consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
    FOREIGN KEY (medico_id) REFERENCES medicos (id)
);

-- Tabela Medicamentos
CREATE TABLE medicamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    principio_ativo VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    lote VARCHAR(20) NOT NULL,
    validade DATE NOT NULL
);

-- Tabela Receitas Médicas
CREATE TABLE receitas_medicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    consulta_id INT NOT NULL,
    medicamento_id INT NOT NULL,
    posologia TEXT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (consulta_id) REFERENCES consultas (id),
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos (id)
);

-- Tabela Exames
CREATE TABLE exames (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL
);

-- Tabela Consultas_Exames (tabela intermediária para relacionamento N:N entre Consultas e Exames)
CREATE TABLE consultas_exames (
    consulta_id INT NOT NULL,
    exame_id INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    data_resultado DATE,
    resultado TEXT,
    PRIMARY KEY (consulta_id, exame_id),
    FOREIGN KEY (consulta_id) REFERENCES consultas (id),
    FOREIGN KEY (exame_id) REFERENCES exames (id)
);

-- Inserir dados na tabela Pacientes
INSERT INTO pacientes (nome, data_nascimento, cpf, telefone, endereco) VALUES
('João Silva', '1985-07-10', '111.222.333-44', '(11) 91234-5678', 'Rua das Flores, 123, São Paulo'),
('Maria Souza', '1992-02-28', '222.333.444-55', '(11) 92345-6789', 'Rua das Pedras, 456, São Paulo'),
('Bruna', '2005-10-6', '333.444.555-66', '(11) 2737-6789', 'Rua jose de fontes, 456, São Paulo'),
('João Silva', '1985-03-15', '123.456.789-00', '(11) 98765-4321', 'Rua A, 123, São Paulo'),
('Maria Oliveira', '1990-07-22', '987.654.321-00', '(11) 98765-4322', 'Rua B, 456, São Paulo'),
('Pedro Santos', '1975-05-30', '666.777.888-99', '(11) 98765-4323', 'Rua C, 789, São Paulo');

-- Inserir dados na tabela Médicos
INSERT INTO medicos (nome, crm, especialidade, telefone) VALUES
('Dr. Pedro Ferreira', '12345-SP', 'Clínico Geral', '(11) 93456-7890'),
('Dra. Ana Oliveira', '67890-SP', 'Pediatra', '(11) 94567-8901'),
('Dr. Carlos Pereira', '654321-SP', 'Cardiologia', '(11) 99988-7766'),
('Dra. Ana Costa', '54321-SP', 'Pediatria', '(11) 99988-7767'),
('Dr. Felipe Almeida', '45678-SP', 'Neurologia', '(11) 99988-7768');

-- Inserir dados na tabela Consultas
INSERT INTO consultas (data_hora, paciente_id, medico_id, observacoes) VALUES
('2023-03-15 09:00:00', 1, 1, 'Paciente com dores de cabeça frequentes.'),
('2023-03-15 10:00:00', 2, 2, 'Consulta de rotina para criança.'),
('2023-08-10 09:00:00', 3, 3, 'Consulta de rotina'),
('2023-08-12 14:00:00', 4, 4, 'Consulta para acompanhamento'),
('2023-08-14 16:00:00', 5, 5, 'Dor de cabeça frequente');

-- Inserir dados na tabela Medicamentos
INSERT INTO medicamentos (nome, principio_ativo, fabricante, lote, validade) VALUES
('Dorflex', 'Dipirona Monoidratada + Cafeína + Orfenadrina', 'Sanofi', 'A123B456', '2023-12-31'),
('Paracetamol', 'Paracetamol', 'Genéricos', 'X789Y1011', '2024-06-30'),
('Dipirona', 'Dipirona Sódica', 'Laboratório A', 'AB123', '2025-05-15'),
('Amoxicilina', 'Amoxicilina Triidrato', 'Laboratório B', 'BC456', '2024-11-30'),
('Paracetamol', 'Paracetamol', 'Laboratório C', 'CD789', '2025-02-28');

-- Inserir dados na tabela Receitas Médicas
INSERT INTO receitas_medicas (consulta_id, medicamento_id, posologia, quantidade) VALUES
(1, 1, 'Tomar 1 comprimido a cada 6 horas em caso de dor.', 10),
(1, 2, 'Tomar 1 comprimido a cada 8 horas em caso de febre.', 10),
(2, 3, '1 comprimido a cada 8 horas', 10),
(3, 4, '1 cápsula de 500mg a cada 12 horas', 20),
(4, 5, '1 comprimido a cada 6 horas', 15);



-- Inserir dados na tabela Exames
INSERT INTO exames (nome, descricao) VALUES
('Hemograma completo', 'Exame de sangue que avalia as células sanguíneas.'),
('Glicemia em jejum', 'Exame de sangue que mede a taxa de glicose na corrente sanguínea.'),
('Exame de Sangue', 'Exame completo de sangue'),
('Raio-X de Tórax', 'Raio-X para avaliar os pulmões'),
('Eletrocardiograma', 'Exame para medir a atividade elétrica do coração');

-- Inserir dados na tabela Consultas_Exames
INSERT INTO consultas_exames (consulta_id, exame_id, data_solicitacao, data_resultado, resultado) VALUES
(1, 1, '2023-03-15', '2023-03-17', 'Resultados normais.'),
(2, 2, '2023-03-15', '2023-03-17', 'Glicemia: 95 mg/dL.'),
(3, 3, '2023-08-10', '2023-08-12', 'Tudo normal'),
(4, 4, '2023-08-12', '2023-08-14', 'Sem alterações significativas'),
(5, 5, '2023-08-14', '2023-08-15', 'Indicação de acompanhamento cardíaco');