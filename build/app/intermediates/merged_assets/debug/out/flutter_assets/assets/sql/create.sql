CREATE TABLE IF NOT EXISTS fornecedor(
    _id             INTEGER PRIMARY KEY autoincrement,
    id              INTEGER,
    nome            TEXT,
    cnpj            TEXT,
    email           TEXT,
    telefone        TEXT
);