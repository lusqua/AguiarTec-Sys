# API Sistema de gestão

> Este projeto consiste em uma api simples de gestão com o intuito de aprender mais e praticar com o ruby e o rails, além de proporcionar um canal de gestão de clientes e computadores dentro do meu ambiente de serviço.

## Rotas

Todo o roteamento é baseado no url /api/... tendo seus versionamentos sitados em seguida.
Todas as rotas necessitam de authenticação para o acesso.

### Clientes

`/api/v1/clientes ` - Retorna todos os clientes cadastrados no usuário logado.

`/api/v1/clientes/1 ` - Retorna o cliente referente ao id especificado.

### Computers

`/api/v1/computers/ ` - Retorna todos os computadores cadastrados no usuário logado.
