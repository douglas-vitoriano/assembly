# Análise dos Arquivos de Assembly e Shell Script

## 1. hello.asm

O arquivo `hello.asm` é um código em Assembly que imprime uma mensagem na tela. Abaixo, cada parte do código é explicada.

### 1. Seções do Código

#### 1.1. `section .data`

Esta seção é onde são declaradas as variáveis e constantes que serão utilizadas no programa. Aqui, a mensagem que será exibida é definida.

```asm
section .data
    msg db 'Odeio a ideia de: Hello World!', 0xA
    tam equ $- msg
```
- msg: Nome da variável que armazenará a string a ser impressa.
- db: Directiva que aloca um byte de dados. Neste caso, é utilizada para armazenar a string.
- 'Odeio a ideia de: Hello World!': A string a ser exibida.
- 0xA: Código hexadecimal para o caractere de nova linha (newline).

```asm
tam equ $- msg
```

- tam: Um rótulo que define o tamanho da string. equ é uma diretiva que atribui um valor constante. $ refere-se à posição atual no código, e msg é a posição inicial, assim tam representa o tamanho da mensagem.

#### 1.2. section .text

Esta seção contém o código executável do programa.

```asm
section .text
global _start
```
- global _start: Define a entrada do programa. _start é o ponto de partida da execução.

### 2. Instruções do Programa

```asm
_start:
```
Início do código executável.

```asm
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg
    mov edx, tam
    int 0x80
```

- mov eax, 0x4: A instrução mov move o valor 0x4 (chamada de sistema para escrever) para o registrador eax.
- mov ebx, 0x1: Armazena 0x1 em ebx, que representa o descritor de arquivo para a saída padrão (stdout).
- mov ecx, msg: Move o endereço da mensagem a ser impressa para o registrador ecx.
- mov edx, tam: Armazena o tamanho da mensagem em edx.
- int 0x80: Interrupção que invoca o sistema operacional para executar a chamada de sistema especificada pelos valores em eax, ebx, ecx e edx.
  
#### 2.1. Saída do Programa

```asm
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80
```
- mov eax, 0x1: Indica que a chamada de sistema para sair está sendo preparada.
- mov ebx, 0x0: Define o código de saída como 0 (sem erros).
- int 0x80: Faz a chamada de saída para o sistema operacional.

COMPILAR -> Transforma o código para linguagem de máquina (binário)
            nasm -f elf64

LINKEDITAR -> Transforma o programa em linguagem de máquina para um executável
              ld -s -o