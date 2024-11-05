CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CNH VARCHAR(20),
    Endereço VARCHAR(200),
    Contato VARCHAR(50),
    DataNascimento DATE,
    Email VARCHAR(100),
    ExperienciaAnos INT,
    Qualificacao VARCHAR(200),
    UltimaViagem DATE,
    ViagensTotais INT
);

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Empresa VARCHAR(100),
    Endereço VARCHAR(200),
    Contato VARCHAR(50),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    DataCadastro DATE,
    UltimoPedido DATE,
    NumeroPedidos INT,
    Preferencias VARCHAR(200)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID INT,
    DriverID INT,
    DetalhesPedido TEXT,
    DataEntrega DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TRIGGER AtualizarViagens
ON Orders
AFTER INSERT
AS
BEGIN
    UPDATE Drivers
    SET UltimaViagem = GETDATE(),
        ViagensTotais = ViagensTotais + 1
    WHERE DriverID IN (SELECT DriverID FROM inserted);
END;

CREATE TRIGGER AtualizarPedidos
ON Orders
AFTER INSERT
AS
BEGIN
    UPDATE Clients
    SET UltimoPedido = GETDATE(),
        NumeroPedidos = NumeroPedidos + 1
    WHERE ClientID IN (SELECT ClientID FROM inserted);
END;

INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato, DataNascimento, Email, ExperienciaAnos, Qualificacao, UltimaViagem, ViagensTotais)
VALUES
(1, 'João Silva', '12345678901', 'Rua das Flores, 123', '(11) 9999-8888', '1980-01-01', 'joao@example.com', 10, 'Experiência em entregas locais', GETDATE(),0),
(2, 'Maria Oliveira', '98765432109', 'Avenida dos Pássaros, 456', '(11) 7777-6666', '1975-05-10', 'maria@example.com', 8, 'Experiência em transporte de cargas pesadas', GETDATE(), 0),
(3, 'José Santos', '45678901234', 'Travessa das Árvores, 789', '(11) 5555-4444', '1983-12-15', 'jose@example.com', 12, 'Experiência em rotas de longa distância', GETDATE(), 0),
(4, 'Ana Souza', '98765432101', 'Praça Central, 789', '(11) 3333-2222', '1990-07-20', 'ana@example.com', 5, 'Experiência em transporte de passageiros', GETDATE(), 0),
(5, 'Pedro Costa', '45678901289', 'Rua dos Comerciantes, 456', '(11) 1111-0000', '1988-03-25', 'pedro@example.com', 7, 'Experiência em transporte de mercadorias perecíveis', GETDATE(), 0);

INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato, Telefone, Email, DataCadastro, Preferencias)
VALUES
(1, 'Maria Silva', 'ABC Company', 'Rua das Flores, 123', 'Maria Silva', '(11) 9999-8888', 'maria.silva@example.com', GETDATE(), 'Entrega rápida'),
(2, 'João Oliveira', 'XYZ Corporation', 'Avenida dos Pássaros, 456', 'João Oliveira', '(11) 7777-6666', 'joao.oliveira@example.com', GETDATE(), 'Transporte seguro'),
(3, 'Ana Santos', '123 Logistics', 'Travessa das Árvores, 789', 'Ana Santos', '(11) 5555-4444', 'ana.santos@example.com', GETDATE(), 'Entrega agendada'),
(4, 'Pedro Souza', 'Quick Delivery', 'Praça Central, 789', 'Pedro Souza', '(11) 3333-2222', 'pedro.souza@example.com', GETDATE(), 'Frete grátis'),
(5, 'Mariana Costa', 'Express Shipping', 'Rua dos Comerciantes, 456', 'Mariana Costa', '(11) 1111-0000', 'mariana.costa@example.com', GETDATE(), 'Embalagens personalizadas');

INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato, DataNascimento, Email, ExperienciaAnos, Qualificacao, UltimaViagem, ViagensTotais)
VALUES
(1, 'João Silva', '12345678901', 'Rua das Flores, 123', '(11) 9999-8888', '1980-01-01', 'joao@example.com', 10, 'Experiência em entregas locais', GETDATE(),0),
(2, 'Maria Oliveira', '98765432109', 'Avenida dos Pássaros, 456', '(11) 7777-6666', '1975-05-10', 'maria@example.com', 8, 'Experiência em transporte de cargas pesadas', GETDATE(), 0),
(3, 'José Santos', '45678901234', 'Travessa das Árvores, 789', '(11) 5555-4444', '1983-12-15', 'jose@example.com', 12, 'Experiência em rotas de longa distância', GETDATE(), 0),
(4, 'Ana Souza', '98765432101', 'Praça Central, 789', '(11) 3333-2222', '1990-07-20', 'ana@example.com', 5, 'Experiência em transporte de passageiros', GETDATE(), 0),
(5, 'Pedro Costa', '45678901289', 'Rua dos Comerciantes, 456', '(11) 1111-0000', '1988-03-25', 'pedro@example.com', 7, 'Experiência em transporte de mercadorias perecíveis', GETDATE(), 0);

