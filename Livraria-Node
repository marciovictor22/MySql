const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const port = 3000;
const mysql = require('mysql');

//Configurando o body parser
app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());

//Definindo as rotas
const router = express.Router();

//Rota raiz
router.get('/', (req, res) => res.json({ message: 'Funcionando'}));
app.use('/', router);

//Inicia o servidor
app.listen(port);
console.log('Servidor iniciado e aguardando conexões na porta 3000');

//Criando a listagem de clientes
var uriConnection = {
    host: 'db4free.net',
    port: 3306,
    user: 'pud_aluno_03',
    password: '12345678',
    database: 'pud_banco_03'
};

function execSQLServer(sqlQry, values, res) {
    const connection = mysql.createConnection(uriConnection);
    connection.query(sqlQry, values, 
        function(error, results, fields){
            if(error)
            res.json(error);
            else
            res.json(results);
            connection.end();
            console.log('Executou: [SQL= ' +sqlQry+ '] - [Values= ' +values+ ']' );
        }
    );
}

//Rota Livro
// Metodo HTTP GET
router.get('/livro/:id?',
    (req, res) => {
        let = sqlQry ='SELECT * FROM livro';
        let values = [];

        if(req.param.id){
            sqlQry += 'WHERE idLivro = ?';
            values = [parseInst(req.params.id)];
        }
        execSQLQuery(sqlQry, values, res);
    }
);

//Metodo POST - Livro
router.post('/livro',
     (req, res) => {
    const nome = req.body.nome;
    const descricao = req.body.descricao;
    const total_paginas = req.body.total_paginas;
    const livro_valor = req.body.livro_valor;
    const ano_de_publicacao = req.body.ano_de_publicacao;
    const edicao = req.body.edicao;

    const sqlQry = 'INSERT INTO pud_banco_03.livro (nome, decscricao, total_paginas, livro_valor, anode_de_publicacao, edicao) VALUES(?)';
    const values = [[nome, decscricao, total_paginas, livro_valor, anode_de_publicacao, edicao]];

    execSQLQuery(sqlQry, values, res);
    }
);

// Metodo HTTP DELETE
router.delete('/livro/:id',
    (req, res) => {
        const sqlQry = 'Delete From Livro Where idLivro = ?';
        const values = [parseInt(req.params.id)];

        execSQLQuery(sqlQry, values, res);
    }
);

// Metodo HTTP PATCH
router.patch('/livro/:id',
    (req, res) => {
        const sqlQry = 'UPDATE livro Set nome = ?, descricao = ?, total_paginas = ?, livro_valor = ?, ano_de_publicacao = ?, edicao = ? WHERE idLivro = ?'; 
        const values =   [req.body.nome, req.body.descricao, req.body.total_paginas, req.body.total_paginas, req.body.livro_valor, req.body.ano_de_publicacao, req.body.edicao, parseInt(req.params.id)];

        execSQLQuery(sqlQry, values, res);
    }
);



//Rota Genero
//Metodo HTTP GET
router.get('/genero/:id?',
    (req, res) => {
        let = sqlQry = 'SELECT * FROM genero';
        let values = [];

        if(req.param.id){
            sqlQry += 'WHERE idGenero = ?';
            values = [parseInst(req.params.id)];
        }
        execSQLQuery(sqlQry, values, res);
    }
);

//Metodo HTTP Post
router.post('/genero',
    (req, res) => {
        const nome = req.body.nome;

        const sqlQry = 'INSERT INTO pud_banco_03.genero (nome) VALUES(?)';
        const values = [[nome]];

        execSQLQuery(sqlQry, values, res);
    }
);

//Metodo HTTP DELETE
router.delete('/genero/:id',
    (req, res) => {
        const sqlQry = 'DELETE FROM genero WHERE idGenero = ?';
        const values = [parseInt(req.params.id)];

        execSQLQuery(sqlQry, values, res);
    }
);

//Metodo HTTP PUT/PATCH
router.patch('/genero/:id',
    (req, res) => {
        const sqlQry = 'UPDATE genero Set nome = ? WHERE idGenero = ?';
        const values = [req.bodyç.nome ,parseInt(req.params.id)];

        execSQLQuery(sqlQry, req, res);
    }
);
