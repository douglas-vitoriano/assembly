#!/bin/bash

# chmod +x compile.sh
# ./compile.sh

# Verifica se existem arquivos .asm ou .s no diretório atual
ASM_FILES=( *.asm *.s )

if [ ${#ASM_FILES[@]} -eq 0 ]; then
    echo "Nenhum arquivo .asm ou .s encontrado no diretório."
    exit 1
fi

# Loop através de todos os arquivos .asm ou .s encontrados
for ASM_FILE in "${ASM_FILES[@]}"; do
    # Verifica se o arquivo existe e é um arquivo regular
    if [ -f "$ASM_FILE" ]; then
        echo "Processando $ASM_FILE..."
        
        # Determina a extensão e gera o nome do arquivo objeto correspondente
        case "${ASM_FILE##*.}" in
            asm)
                OBJ_FILE="${ASM_FILE%.asm}.o"
                ;;
            s)
                OBJ_FILE="${ASM_FILE%.s}.o"
                ;;
        esac

        # Compila o arquivo .asm ou .s para gerar o arquivo objeto
        nasm -f elf64 "$ASM_FILE" -o "$OBJ_FILE"

        # Verifica se o comando nasm foi bem-sucedido
        if [ $? -ne 0 ]; then
            echo "Erro na compilação do arquivo $ASM_FILE"
            continue
        fi

        echo "=== Exibindo informações com objdump para $OBJ_FILE ==="
        objdump -d "$OBJ_FILE"
        echo

        echo "=== Verificando a integridade do arquivo com sha256sum para $OBJ_FILE ==="
        sha256sum "$OBJ_FILE"
        echo

        # Linka o arquivo objeto para criar um executável
        EXEC_FILE="${OBJ_FILE%.o}"
        ld -s -o "$EXEC_FILE" "$OBJ_FILE"
        
        # Cria um arquivo de disassembly
        DISASM_FILE="${EXEC_FILE}.disasm.S"
        objdump -d "$EXEC_FILE" -l > "$DISASM_FILE"
        
        # Cria uma pasta com o mesmo nome do arquivo original
        DIR_NAME="${ASM_FILE%.*}_compiles"
        mkdir -p "$DIR_NAME"
        
        # Move os arquivos gerados para a nova pasta
        mv "$EXEC_FILE" "$DIR_NAME/"
        mv "$OBJ_FILE" "$DIR_NAME/"
        mv "$DISASM_FILE" "$DIR_NAME/"
        
        # Executa o programa compilado
        echo "Executando o programa: $EXEC_FILE"
        echo
        ./"$DIR_NAME/$EXEC_FILE"
        echo        
        
        echo "-----------------------------------"
        echo "Executáveis criados: $EXEC_FILE, $DISASM_FILE e movidos para $DIR_NAME"
        echo
    fi
done

echo "Processamento concluído."
echo
