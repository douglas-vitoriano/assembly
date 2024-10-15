## Configurações para a Ferramenta de Desassemblagem

O arquivo settings.json contém configurações específicas para a ferramenta de desassemblagem.

#### Conteúdo do Arquivo

```json
"disasexpl.associations": {
    "**/*.asm": "${fileDirname}/${fileBasenameNoExtension}.disasm.S",
    "**/*.s": "${fileDirname}/${fileBasenameNoExtension}.disasm.S"
},
"disasexpl.useBinaryParsing": true
```

- disasexpl.associations: Define associações de arquivos para desassemblagem, especificando que arquivos .asm e .s devem gerar arquivos .disasm.S na mesma pasta.
- disasexpl.useBinaryParsing: Ativa o parsing binário para uma melhor interpretação dos arquivos de desassemblagem.