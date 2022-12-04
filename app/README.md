## Config RoBrawser
#### Usando o ````patch```` para mudar os arquivos de forma rápida.

Com o git instalado na sua maquina jogue o arquivo ````0201-config-client.patch```` dentro do diretório ````./roBrowser```` e execute:

````
git apply 0201-config-client.patch
````

#### Mudar os arquivos
````
    app/roBrowser/client/Client.php
    app/roBrowser/client/index.php
    e
    app/roBrowser/client/BGM
    app/roBrowser/client/data
    app/roBrowser/client/resources
````

## As alterações dos arquivos ``client/Client.php`` e ``client/index.php`` pode ser usado o comando ``git apply`` em ``0201-config-client.patch``. 
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
