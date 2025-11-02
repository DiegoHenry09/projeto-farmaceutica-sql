CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    tipo_cliente VARCHAR(50),
    regiao VARCHAR(50),
    uf CHAR(2),
    canal VARCHAR(50)
);


CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(50),
    preco_base DECIMAL(10, 2),
    marca VARCHAR(50),
    linha VARCHAR(50)
);


CREATE TABLE representantes (
    rep_id INT PRIMARY KEY,
    nome_rep VARCHAR(100),
    regiao VARCHAR(50)
);


CREATE TABLE vendas (
    venda_id INT PRIMARY KEY,
    data DATE,
    cliente_id INT,
    produto_id INT,
    rep_id INT,
    regiao VARCHAR(50),
    uf CHAR(2),
    canal VARCHAR(50),
    qtd INT,
    preco_unit DECIMAL(10, 2),
    desconto DECIMAL(4, 2),
    receita_bruta DECIMAL(10, 2),
    receita_liquida DECIMAL(10, 2),
    
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id),
    FOREIGN KEY (rep_id) REFERENCES representantes(rep_id)
);


CREATE TABLE pagamentos (
    venda_id INT PRIMARY KEY,
    data_emissao DATE,
    data_vencimento DATE,
    data_pagamento DATE,
    forma_pagamento VARCHAR(50),
    status_pagamento VARCHAR(50),
    valor_titulo DECIMAL(10, 2),

    FOREIGN KEY (venda_id) REFERENCES vendas(venda_id)
);