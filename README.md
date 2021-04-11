# RagnaDocker

## Config Emulador

#### 1 º - Baixe o emulador ou adicione o seu emulador na pasta [serve](https://github.com/FranciscoWallison/RagnaDockerCompose/tree/main/serve) 
EXP: 
````
  ./serve/rathena
  ./serve/Hercules
````
#### 2 º - Altere a [linha](https://github.com/FranciscoWallison/RagnaDockerCompose/blob/main/docker-compose.yaml#L14) ````<EMULADOR>```` para a pasta do emulador baixado ou seu.
EXP: 
````
- ./serve/rathena:/emulador
- ./serve/Hercules:/emulador
````
#### 3 º - Nas configurações de acesso ao banco de dados que os emuladores utilizam como o arquivo ````inter_athena.conf````, substitua ````127.0.0.1```` por ````db````.
#### 4 º - Nas configurações de acesso como ````char_athena.conf````, ````login_athena.conf```` e ````map_athena.conf```` substitua ````127.0.0.1```` por ````server````.
#### 5 º - Configurando as tabelas do banco de dados na [linha](https://github.com/FranciscoWallison/RagnaDockerCompose/blob/main/docker-compose.yaml#L36) ````- ./db/<MYTABLES>:/docker-entrypoint-initdb.d```` substitua pela [pasta](https://github.com/FranciscoWallison/RagnaDockerCompose/tree/main/db) com todas suas tabelas.


EXP-PASTA: 
````
  /db/pre-renewal
    - item_db.sql
    - mob_db.sql
    - logs.sql
    - main.sql
...
  /db/renewal
    - item_db_re.sql
    - mob_db_re.sql
    - logs.sql
    - main.sql
````
EXP-docker-compose.yaml: 
````
  - ./db/pre-renewal:/docker-entrypoint-initdb.d
...
  - ./db/renewal:/docker-entrypoint-initdb.d
````
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
 - ./entrypoint.sh 
 - wsproxy -a serve:6900,serve:6121,serve:5121
 - docker-compose -f "docker-compose.yaml" up -d --build