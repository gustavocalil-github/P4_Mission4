CREATE TABLE Drivers (
    DriverID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CNH VARCHAR(20) NOT NULL,
    Endereço VARCHAR(200),
    Contato VARCHAR(50)
);

CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Empresa VARCHAR(100),
    Endereço VARCHAR(200),
    Contato VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    DriverID INT NOT NULL,
    DetalhesPedido TEXT,
    DataEntrega DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

INSERT INTO Drivers (Nome, CNH, Endereço, Contato) VALUES 
('Gustavo Calil', '111111111', 'Rua Beta, 100', 'email@email.com'),
('Guilherme Calil', '222222222', 'Rua Alfa, 200', 'email2@email.com');

INSERT INTO Clients (Nome, Empresa, Endereço, Contato) VALUES 
('Empresa A', 'Empresa A Ltda', 'Avenida Central, 500', 'contato@empresaa.com'),
('Empresa B', 'Empresa B SA', 'Rua do Comércio, 10', 'contato@empresab.com');

INSERT INTO Orders (ClientID, DriverID, DetalhesPedido, DataEntrega, Status) VALUES 
(1, 1, 'Entrega de 50 caixas', '2024-09-01', 'Pendente'),
(2, 2, 'Entrega de 100 caixas', '2024-09-05', 'Em Andamento');

SELECT Orders.OrderID, Clients.Nome AS Cliente, Drivers.Nome AS Motorista, Orders.Status
FROM Orders
JOIN Clients ON Orders.ClientID = Clients.ClientID
JOIN Drivers ON Orders.DriverID = Drivers.DriverID;

UPDATE Orders
SET Status = 'Entregue'
WHERE OrderID = 1;

DELETE FROM Orders
WHERE OrderID = 2;
