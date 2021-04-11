# RagnaDocker

## Config Emulador

#### 1 º - Baixe o emulador ou adicione o seu emulador na pasta [serve](https://github.com/rathena) como rathena.
EXP: 
````
  ./serve/rathena
````
#### 2 º - Referencia do seu amulador.
EXP: 
````
- ./serve/rathena:/emulador
````
#### 3 º - Nas configurações de acesso ao banco de dados que os emuladores utilizam como o arquivo ````inter_athena.conf````, substitua ````127.0.0.1```` por ````db````.
EXP-PASTA: 
````
  /db/sql-file
    - item_db.sql
    - mob_db.sql
    - logs.sql
    - main.sql
````
EXP-docker-compose.yaml: 
````
  - ./db/sql-files:/docker-entrypoint-initdb.d
````

#### 4 º - Nas configurações de acesso como ````char_athena.conf````, ````login_athena.conf```` e ````map_athena.conf```` substitua ````127.0.0.1```` por ````server````.
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
//char_ip: 127.0.0.1
//bind_ip: 127.0.0.1
//map_ip: 127.0.0.1
````
Para
````
char_ip: serve
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

#### Copile o seu emulador. 
Elembrar de acessar o conteiner do emulador ````docker exec -i -t serve-ragnarok /bin/bash````.

Exemplo:  ````./configure --enable-packetver=20141022 && make clean && make server```` ou ````./entrypoint.sh````
## Config RoBrawser
#### Mudar os arquivos
````
    app/roBrowser/client/Client.php
    app/roBrowser/client/index.php
    e
    app/roBrowser/client/BGM
    app/roBrowser/client/data
    app/roBrowser/client/resources
````
## Arquivos Client.php
Mude as linhas
````if (file_exists($local_pathEncoded) && !is_dir($local_pathEncoded) && is_readable($local_pathEncoded)) {````

Para

````if (file_exists($local_pathEncoded) && is_readable($local_pathEncoded)) {````

## Arquivos index.php
#### 1º passo
Mude as linhas
````if (empty($_SERVER['REDIRECT_STATUS']) || $_SERVER['REDIRECT_STATUS'] != 404 || empty($_SERVER['REQUEST_URI'])) {````

Para

````if (empty($_SERVER['REDIRECT_STATUS']) || empty($_SERVER['REQUEST_URI'])) {````

#### 2º passo
Mude as linhas
````if (empty($_SERVER['REDIRECT_STATUS']) || $_SERVER['REDIRECT_STATUS'] != 404 || empty($_SERVER['REQUEST_URI'])) {````

Para

````if (empty($_SERVER['REDIRECT_STATUS']) || empty($_SERVER['REQUEST_URI'])) {````

#### 3º passo
REMOVA o bloco de codigo
````
	// Check Allowed directory
	if (!preg_match( '/\/('. $directory . '\/)?(data|BGM)\//', $path)) {
		Debug::write('Forbidden directory, you can just access files located in data and BGM folder.', 'error');
		Debug::output();
	}

````
FICARA VAZIOS
#### 4º passo
app/roBrowser/client/BGM
  - Os arquivos .mp3 do seu serve
app/roBrowser/client/data
  - Adicione a sua pasta ````data```` em ````./data````. 
app/roBrowser/client/resources
  - E em ````resources```` a ````data.grf```` completa com a ````DATA.INI```` configurada.

# Comandos uteis
 - docker exec -i -t serve-ragnarok /bin/bash
 - ./entrypoint.sh 
 - ./configure --enable-packetver=20141022 && make clean && make server
 - wsproxy -a serve:6900,serve:6121,serve:5121
 - docker-compose -f "docker-compose.yaml" up -d --build
