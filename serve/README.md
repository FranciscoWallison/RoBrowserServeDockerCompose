# RagnaDocker

#### Mudar os arquivos
````
    rathena/conf/inter_athena.conf
    rathena/conf/char_athena.conf  
    rathena/conf/map_athena.conf
    rathena/conf/login_athena.conf
    rathena/conf/subnet_athena.conf
    e
    rathena/src/custom/defines_pre.hpp
````
## Arquivos inter_athena.conf
Mude de as linhas ````_ip: 127.0.0.1```` para ````_ip: db````
EXP:
````login_server_ip: 127.0.0.1```` para  ````login_server_ip: db````
## Arquivos char_athena.conf
Mude as linhas
````
//login_ip: 127.0.0.1
//bind_ip: 127.0.0.1
//char_ip: 127.0.0.1
````
Para
````
login_ip: serve
bind_ip: serve
char_ip: serve
````
Lembrar de remover ````//```` os comentário
## Arquivos map_athena.conf
Mude as linhas
````
//login_ip: 127.0.0.1
//bind_ip: 127.0.0.1
//map_ip: 127.0.0.1
````
Para
````
login_ip: serve
bind_ip: serve
map_ip: serve
````
Lembrar de remover ````//```` os comentário
## Arquivos login_athena.conf
Mude as linhas
````
//bind_ip: 127.0.0.1
````
Para
````
bind_ip: serve
````
Lembrar de remover ````//```` os comentário
_____
Criar conta utilizando ````_M/_F````
Mude as linhas
````
new_account: no
````
Para
````
new_account: yes
````
## Arquivos subnet_athena.conf
Mude as linhas
````
subnet: 255.0.0.0:127.0.0.1:127.0.0.1
````
Para
````
subnet: 0.0.0.0:127.0.0.1:127.0.0.1
````
## Arquivos defines_pre.hpp
Antes da linha 
````#endif /* CONFIG_CUSTOM_DEFINES_PRE_HPP */````
adicione
````
#define PACKET_OBFUSCATION_KEY1 0x290551EA
#define PACKET_OBFUSCATION_KEY2 0x2B952C75
#define PACKET_OBFUSCATION_KEY3 0x2D67669B
#define PRERE
````