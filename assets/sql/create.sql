CREATE TABLE IF NOT EXISTS fornecedor(
    _id             INTEGER PRIMARY KEY autoincrement,
    id              INTEGER,
    nome            TEXT,
    cnpj            TEXT,
    email           TEXT,
    telefone        TEXT
);

CREATE TABLE IF NOT EXISTS catalogo(
    _id             INTEGER PRIMARY KEY autoincrement,
    id              TEXT,
    path            TEXT
);