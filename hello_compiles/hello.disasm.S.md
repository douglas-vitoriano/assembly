## Desassemblagem do Arquivo Executável: hello

Este arquivo é o resultado da desassemblagem do arquivo executável gerado. Cada linha do código representa uma instrução em Assembly e seu endereço na memória.

#### Exemplo de Desassemblagem -> **[hello.disasm.S](https://github.com/douglas-vitoriano/assembly/blob/main/hello.asm)**


```perl
hello:     file format elf64-x86-64

Disassembly of section .text:

0000000000401000 <.text>:
  401000:	b8 04 00 00 00       	mov    $0x4,%eax
  401005:	bb 01 00 00 00       	mov    $0x1,%ebx
  40100a:	b9 00 20 40 00       	mov    $0x402000,%ecx
  40100f:	ba 1f 00 00 00       	mov    $0x1f,%edx
  401014:	cd 80                	int    $0x80
  401016:	b8 01 00 00 00       	mov    $0x1,%eax
  40101b:	bb 00 00 00 00       	mov    $0x0,%ebx
  401020:	cd 80                	int    $0x80

```

- Endereços de Memória: Os números à esquerda (ex: 401000) representam o endereço de memória de cada instrução.

- Instruções: Cada linha contém o código de operação (opcode) e os operandos correspondentes em formato hexadecimal.