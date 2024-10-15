# Projeto Assembly

Este repositório contém uma série de etapas que estou realizando para aprender Assembly. Cada etapa é um passo no meu processo de aprendizado, e neste projeto, a primeira implementação é o famoso programa "Hello World", denominado `hello.asm`.

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- **`hello.asm`**: Este é o primeiro programa escrito em Assembly que imprime a mensagem "Odeio a ideia de: Hello World!" na tela. Abaixo estão as seções principais do código, que estão explicadas em detalhe no arquivo `hello.asm.md`.

- **`hello.asm.md`**: Um arquivo markdown que contém a análise detalhada do código em `hello.asm`, explicando cada parte do código, desde as seções de dados até as instruções de execução.

- **`hello_compiles/hello.disasm.S.md`**: Após compilar o arquivo `hello.asm`, esse arquivo contém a desassemblagem do executável resultante, mostrando como o código Assembly se traduz em instruções de máquina.

- **`registrars.md`**: Um guia sobre registradores utilizados em Assembly, abrangendo registradores de 64 e 32 bits, bem como a extensão dos valores hexadecimais.

## Primeira Etapa: Hello.asm

O primeiro arquivo que criamos é `hello.asm`, onde implementamos a funcionalidade básica de imprimir uma mensagem na tela. A análise detalhada do código pode ser encontrada no arquivo `hello.asm.md`.

### Como Funciona

1. **Compilação**: O arquivo `hello.asm` é compilado utilizando o `nasm`, que transforma o código Assembly em um arquivo objeto.
2. **Ligação**: O arquivo objeto é então ligado com o `ld` para criar um executável.
3. **Execução**: O executável é executado, e a mensagem é exibida na tela.

## Registradores em Assembly

O arquivo `registrars.md` fornece uma visão abrangente dos registradores utilizados em Assembly, essenciais para entender como os dados são manipulados durante a execução do código.

## Licença

Este projeto está sob a licença MIT.
