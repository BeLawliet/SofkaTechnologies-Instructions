-- ========================
-- DDL (PostgreSQL)
-- ========================
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    identification BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gender VARCHAR(10) NOT NULL CHECK (gender IN ('MALE', 'FEMALE')),
    age INT NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(50),
    customer_id UUID UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

CREATE TABLE accounts (
    account_number VARCHAR(50) PRIMARY KEY,
    account_type VARCHAR(20) NOT NULL CHECK (account_type IN ('SAVINGS', 'CHECKING')),
    initial_balance NUMERIC(15,2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('ACTIVE', 'INACTIVE')),
    customer_id UUID NOT NULL,
    CONSTRAINT fk_account_customer FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE transactions (
    transaction_id UUID PRIMARY KEY,
    transaction_type VARCHAR(20) NOT NULL CHECK (transaction_type IN ('DEPOSIT', 'WITHDRAWAL')),
    amount NUMERIC(15,2) NOT NULL,
    balance NUMERIC(15,2) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    account_number VARCHAR(50) NOT NULL,
    CONSTRAINT fk_transaction_account FOREIGN KEY (account_number) REFERENCES accounts (account_number)
);

-- ========================
-- INSERTS: CUSTOMERS
-- ========================
INSERT INTO customers (identification, name, gender, age, address, phone, customer_id, password, status) VALUES
(1001, 'Ana López',    'FEMALE', 28, 'Calle 1 #10-20',     '3001111111', '6f1d7f5e-9c8a-4b9e-8c3f-1a2b3c4d5e6f'::uuid, 'P@ssw0rd1', 'ACTIVE'),
(1002, 'Juan Martínez','MALE',   35, 'Carrera 2 #20-10',   '3002222222', '7a2e8f6b-8d9c-4e0f-9b2a-2b3c4d5e6f7a'::uuid, 'Secret123', 'ACTIVE'),
(1003, 'Clara Gómez',  'FEMALE', 42, 'Av. 3 #30-15',       '3003333333', '8b3f9e7c-7c8d-5f1a-0b3c-3c4d5e6f7a8b'::uuid, 'Clave321',  'INACTIVE'),
(1004, 'David Rivera', 'MALE',   30, 'Calle 4 #40-25',     '3004444444', '9c4a6b8d-6b7c-6a2b-1c4d-4d5e6f7a8b9c'::uuid, 'MyPwd123',  'ACTIVE'),
(1005, 'Eva Sánchez',  'FEMALE', 26, 'Cl. 5 #50-30',       '3005555555', 'a1b2c3d4-e5f6-7890-1234-56789abcdef0'::uuid, 'Pwd!2025',  'ACTIVE'),
(1006, 'Frank Molina', 'MALE',   50, 'Av. 6 #60-35',       '3006666666', 'b2c3d4e5-f6a7-8901-2345-6789abcdef01'::uuid, 'Pa$$word',  'INACTIVE'),
(1007, 'Grace Ortiz',  'FEMALE', 33, 'Cra 7 #70-40',       '3007777777', 'c3d4e5f6-a7b8-9012-3456-789abcdef012'::uuid, 'abc12345',  'ACTIVE'),
(1008, 'Henry Castro', 'MALE',   29, 'Cll 8 #80-45',       '3008888888', 'd4e5f6a7-b8c9-0123-4567-89abcdef0123'::uuid, 'helloWorld1','ACTIVE'),
(1009, 'Ivy Torres',   'FEMALE', 40, 'Av. 9 #90-50',       '3009999999', 'e5f6a7b8-c9d0-1234-5678-9abcdef01234'::uuid, 'IvyPass99', 'INACTIVE'),
(1010, 'Jack Ramírez', 'MALE',   37, 'Cra 10 #100-60',     '3001010101', 'f6a7b8c9-d0e1-2345-6789-abcdef012345'::uuid, 'Jack2025',  'ACTIVE');

-- ========================
-- INSERTS: ACCOUNTS
-- ========================
INSERT INTO accounts (account_number, account_type, initial_balance, status, customer_id) VALUES
('ACC001', 'SAVINGS',  1000.00, 'ACTIVE',   '6f1d7f5e-9c8a-4b9e-8c3f-1a2b3c4d5e6f'::uuid),
('ACC002', 'CHECKING',  500.00, 'ACTIVE',   '7a2e8f6b-8d9c-4e0f-9b2a-2b3c4d5e6f7a'::uuid),
('ACC003', 'SAVINGS',  1500.50, 'INACTIVE', '8b3f9e7c-7c8d-5f1a-0b3c-3c4d5e6f7a8b'::uuid),
('ACC004', 'CHECKING', 2000.00, 'ACTIVE',   '9c4a6b8d-6b7c-6a2b-1c4d-4d5e6f7a8b9c'::uuid),
('ACC005', 'SAVINGS',   750.25, 'ACTIVE',   'a1b2c3d4-e5f6-7890-1234-56789abcdef0'::uuid),
('ACC006', 'CHECKING', 1200.00, 'INACTIVE', 'b2c3d4e5-f6a7-8901-2345-6789abcdef01'::uuid),
('ACC007', 'SAVINGS',   300.00, 'ACTIVE',   'c3d4e5f6-a7b8-9012-3456-789abcdef012'::uuid),
('ACC008', 'CHECKING', 4500.75, 'ACTIVE',   'd4e5f6a7-b8c9-0123-4567-89abcdef0123'::uuid),
('ACC009', 'SAVINGS',   980.00, 'INACTIVE', 'e5f6a7b8-c9d0-1234-5678-9abcdef01234'::uuid),
('ACC010', 'CHECKING',  600.00, 'ACTIVE',   'f6a7b8c9-d0e1-2345-6789-abcdef012345'::uuid);

-- ========================
-- INSERTS: TRANSACTIONS
-- ========================
INSERT INTO transactions (transaction_id, transaction_type, amount, balance, created_at, account_number) VALUES
('0a1b2c3d-4e5f-6789-0abc-def012345678'::uuid, 'DEPOSIT',    500.00, 1500.00, '2025-09-07 12:00:00', 'ACC001'),
('1b2c3d4e-5f6a-7890-1bcd-ef0123456789'::uuid, 'WITHDRAWAL', 200.00,  300.00, '2025-09-08 09:30:00', 'ACC002'),
('2c3d4e5f-6a7b-8901-2cde-f0123456789a'::uuid, 'DEPOSIT',   1000.00, 2500.50, '2025-09-09 14:15:00', 'ACC003'),
('3d4e5f6a-7b8c-9012-3def-0123456789ab'::uuid, 'WITHDRAWAL', 500.00, 1500.00, '2025-09-10 11:00:00', 'ACC004'),
('4e5f6a7b-8c9d-0123-4ef0-123456789abc'::uuid, 'DEPOSIT',    750.25, 1500.50, '2025-09-11 16:45:00', 'ACC005'),
('5f6a7b8c-9d0e-1234-5f01-23456789abcd'::uuid, 'WITHDRAWAL', 100.00, 1100.00, '2025-09-12 08:20:00', 'ACC006'),
('6a7b8c9d-0e1f-2345-6a12-3456789abcde'::uuid, 'DEPOSIT',    300.00,  600.00, '2025-09-13 19:05:00', 'ACC007'),
('7b8c9d0e-1f2a-3456-7b23-456789abcdef'::uuid, 'WITHDRAWAL',2000.75, 2500.00, '2025-09-14 13:30:00', 'ACC008'),
('8c9d0e1f-2a3b-4567-8c34-56789abcdef0'::uuid, 'DEPOSIT',    500.00, 1480.00, '2025-09-15 10:10:00', 'ACC009'),
('9d0e1f2a-3b4c-5678-9d45-6789abcdef01'::uuid, 'WITHDRAWAL', 100.00,  500.00, '2025-09-16 21:00:00', 'ACC010');






