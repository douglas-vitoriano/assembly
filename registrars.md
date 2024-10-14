# Registradores

### Registradores R e E

 64 bits  32 bits  Utilização                                                    Exemplo R         Exemplo E        
--------------------------------------------------------------------------------------------------------------------
 RAX      EAX      Valores que são retornados dos comandos em um registrador     `mov RAX, 5`      `mov EAX, 5`     
 RBX      EBX      Registrador preservado. Sempre tenha cuidado ao utilizá-lo    `mov RBX, 10`     `mov EBX, 10`    
 RCX      ECX      Uso livre, como, por exemplo, um contador                     `mov RCX, 0`      `mov ECX, 0`     
 RDX      EDX      Uso livre, em alguns comandos, como operações de divisão      `mov RDX, 2`      `mov EDX, 2`     
 RSP      ESP      Ponteiro da pilha; aponta para o topo da pilha                `push RSP`        `push ESP`       
 RBP      EBP      Registrador preservado. Às vezes armazena ponteiros da pilha  `mov RBP, RSP`    `mov EBP, ESP`   
 RDI      EDI      Na passagem de argumentos, contém o primeiro argumento        `mov RDI, 1`      `mov EDI, 1`     
 RSI      ESI      Na passagem de argumentos, contém os argumentos em si         `mov RSI, [RDI]`  `mov ESI, [EDI]` 


### Registradores R8 a R15

 64 bits  32 bits  Utilização                                                         Exemplo R      Exemplo E      
--------------------------------------------------------------------------------------------------------------------
 R8       R8D      Uso geral, pode ser utilizado como um registrador adicional        `mov R8, 20`   `mov R8D, 20`  
 R9       R9D      Uso geral, ideal para armazenar valores intermediários             `mov R9, 30`   `mov R9D, 30`  
 R10      R10D     Uso geral, comumente utilizado em operações matemáticas            `mov R10, 40`  `mov R10D, 40` 
 R11      R11D     Uso geral, preservado em algumas chamadas de função                `mov R11, 50`  `mov R11D, 50` 
 R12      R12D     Uso geral, frequentemente utilizado em rotinas de chamada          `mov R12, 60`  `mov R12D, 60` 
 R13      R13D     Uso geral, pode ser usado como um ponteiro ou contagem             `mov R13, 70`  `mov R13D, 70` 
 R14      R14D     Uso geral, pode ser usado para armazenar endereços de memória      `mov R14, 80`  `mov R14D, 80` 
 R15      R15D     Uso geral, frequentemente utilizado como registrador temporário    `mov R15, 90`  `mov R15D, 90` 
