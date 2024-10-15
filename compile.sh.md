## Script de Compilação: compile.sh

O arquivo compile.sh é um script em Shell que automatiza o processo de compilação de arquivos .asm e .s, gerando arquivos objeto e executáveis.

### Explicação do Código

```bash
#!/bin/bash

ASM_FILES=( *.asm *.s )

if [ ${#ASM_FILES[@]} -eq 0 ]; then
    echo "Nenhum arquivo .asm ou .s encontrado no diretório."
    exit 1
fi
```
- #!/bin/bash: Shebang que indica que o script deve ser executado com o interpretador Bash.

- ASM_FILES=( *.asm *.s ): Cria uma lista de arquivos com extensão .asm e .s no diretório atual.

- Verifica se a lista de arquivos está vazia. Se sim, exibe uma mensagem e sai do script.

#### 1.1. Loop de Processamento

```bash
for ASM_FILE in "${ASM_FILES[@]}"; do

if [ -f "$ASM_FILE" ]; then
    echo "Processando $ASM_FILE..."

case "${ASM_FILE##*.}" in
    asm)
        OBJ_FILE="${ASM_FILE%.asm}.o"
        ;;
    s)
        OBJ_FILE="${ASM_FILE%.s}.o"
        ;;
esac
```
- Inicia um loop para processar cada arquivo encontrado.
- Verifica se ASM_FILE é um arquivo regular e exibe uma mensagem de processamento.
- Usa case para determinar a extensão do arquivo e cria um nome de arquivo objeto correspondente.
  
#### 1.2. Compilação e Ligação

```bash
nasm -f elf64 "$ASM_FILE" -o "$OBJ_FILE"

ld -s -o "$EXEC_FILE" "$OBJ_FILE"
```

- Compila o arquivo Assembly para um arquivo objeto no formato ELF64.
- Usa o ld para linkar o arquivo objeto e criar um executável.

#### 1.3. Exibição e Verificação

O script utiliza objdump para exibir informações do arquivo objeto e sha256sum para verificar a integridade do arquivo.

```bash
echo "=== Exibindo informações com objdump para $OBJ_FILE ==="
objdump -d "$OBJ_FILE"
echo

echo "=== Verificando a integridade do arquivo com sha256sum para $OBJ_FILE ==="
sha256sum "$OBJ_FILE"
echo
```

#### 1.4. Estrutura de Diretório

Cria um diretório para armazenar os arquivos gerados, baseado no nome do arquivo Assembly original.

```bash
DIR_NAME="${ASM_FILE%.*}_compiles"
mkdir -p "$DIR_NAME"
```

#### 1.5. Execução do Programa

```bash
echo "Executando o programa: $EXEC_FILE"
./"$DIR_NAME/$EXEC_FILE"
```

- Executa o programa compilado e exibe o resultado.