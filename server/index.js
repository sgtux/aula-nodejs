const http = require('http')

const usuarios = [
    { id: 1, nome: 'João', email: 'joao@mail.com' },
    { id: 2, nome: 'Maria', email: 'maria@mail.com' },
    { id: 3, nome: 'Alice', email: 'alice@mail.com' },
    { id: 4, nome: 'Bob', email: 'bob@mail.com' }
]

const server = http.createServer((req, res) => {

    const headerAuthorization = req.headers['authorization']

    if (!headerAuthorization) {
        res.writeHead(401)
        res.end('Informe o token.')
        return
    }

    const token = headerAuthorization.replace('Bearer ', '')
    console.log(token)

    if (token !== 'testetoken123') {
        res.writeHead(401)
        res.end('Token inválido.')
        return
    }

    if (req.url === '/usuarios') {
        res.writeHead(200, { 'content-type': 'application/json' })
        res.end(JSON.stringify(usuarios))
        return
    }

    if (req.url === '/') {
        res.write('Servidor no ar.')
        res.end()
        return
    }

    res.writeHead(404)
    res.end()
})

const PORT = 3001

server.listen(PORT, () => console.log(`Ouvindo na porta ${PORT}`))
