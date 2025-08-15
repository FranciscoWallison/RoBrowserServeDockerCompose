# RagnaDocker

## Настройка эмулятора

#### 1. Скачайте эмулятор или добавьте свой эмулятор в папку [serve](https://github.com/rathena) под названием rathena.
Пример:
````
  ./serve/rathena
````

### Подмодуль (Submodule)
Этот проект использует git submodules для управления эмулятором rAthena. Чтобы клонировать проект и инициализировать подмодуль, используйте следующую команду (замените URL на фактический URL репозитория):

```
git clone --recursive <repository-url>
```

Если вы уже склонировали репозиторий, вы можете инициализировать подмодуль с помощью команды:
```
git submodule update --init --recursive
```
#### 2. Укажите путь к вашему эмулятору.
Пример:
````
- ./serve/rathena:/emulador
````
#### 3. В настройках доступа к базе данных, которые используют эмуляторы, например в файле `inter_athena.conf`, замените `127.0.0.1` на `db`.
Пример структуры папки:
````
  /db/sql-file
    - item_db.sql
    - mob_db.sql
    - logs.sql
    - main.sql
````
Пример в `docker-compose.yaml`:
````
  - ./db/sql-files:/docker-entrypoint-initdb.d
````

#### 4. В настройках доступа, таких как `char_athena.conf`, `login_athena.conf` и `map_athena.conf`, замените `127.0.0.1` на `server`.
#### Файлы для изменения:
````
    rathena/conf/inter_athena.conf
    rathena/conf/char_athena.conf
    rathena/conf/map_athena.conf
    rathena/conf/login_athena.conf
    rathena/conf/subnet_athena.conf
    rathena/src/custom/defines_pre.hpp
````
## Файл inter_athena.conf
Измените строки `_ip: 127.0.0.1` на `_ip: db`
Пример:
`login_server_ip: 127.0.0.1` на `login_server_ip: db`
## Файл char_athena.conf
Измените строки:
````
//login_ip: 127.0.0.1
//bind_ip: 127.0.0.1
//char_ip: 127.0.0.1
````
На:
````
login_ip: serve
bind_ip: serve
char_ip: serve
````
Не забудьте удалить `//` (раскомментировать).
## Файл map_athena.conf
Измените строки:
````
//char_ip: 127.0.0.1
//bind_ip: 127.0.0.1
//map_ip: 127.0.0.1
````
На:
````
char_ip: serve
bind_ip: serve
map_ip: serve
````
Не забудьте удалить `//` (раскомментировать).
## Файл login_athena.conf
Измените строки:
````
//bind_ip: 127.0.0.1
````
На:
````
bind_ip: serve
````
Не забудьте удалить `//` (раскомментировать).
## Файл defines_pre.hpp
Перед строкой
`#endif /* CONFIG_CUSTOM_DEFINES_PRE_HPP */`
добавьте:
````
#define PACKET_OBFUSCATION_KEY1 0x290551EA
#define PACKET_OBFUSCATION_KEY2 0x2B952C75
#define PACKET_OBFUSCATION_KEY3 0x2D67669B
#define PRERE
````
<details><summary><b>NEMO для сравнения шифрования пакетов вашего клиента</b></summary>
<p>

Используйте NEMO для сравнения вашего клиента и...

НЕ выбирайте:

Disable Packet Encryption (Recommended)
Выберите:

Packet First Key Encryption, и укажите ваш 1-й ключ
Packet Second Key Encryption, и укажите ваш 2-й ключ
Packet Third Key Encryption, и укажите ваш 3-й ключ
Затем убедитесь, что вы добавили ваши кастомные ключи в db/[import/]packet_db.txt, в `packet_keys_use: <key1>,<key2>,<key3>`

[packet-keys](https://www.robrowser.com/prototype/packet-keys/)

</p>
</details>

#### Скомпилируйте ваш эмулятор.
Не забудьте войти в контейнер эмулятора: `docker exec -i -t serve-ragnarok /bin/bash`.

Пример: `./configure --enable-packetver=20141022 && make clean && make server` или `./entrypoint.sh`
## Настройка RoBrowser
#### Файлы для изменения:
````
    app/roBrowser/client/Client.php
    app/roBrowser/client/index.php
    а также
    app/roBrowser/client/BGM
    app/roBrowser/client/data
    app/roBrowser/client/resources
````
## Файл Client.php
Измените строку:
`if (file_exists($local_pathEncoded) && !is_dir($local_pathEncoded) && is_readable($local_pathEncoded)) {`

На:

`if (file_exists($local_pathEncoded) && is_readable($local_pathEncoded)) {`

## Файл index.php
#### Шаг 1
Измените строку:
`if (empty($_SERVER['REDIRECT_STATUS']) || $_SERVER['REDIRECT_STATUS'] != 404 || empty($_SERVER['REQUEST_URI'])) {`

На:

`if (empty($_SERVER['REDIRECT_STATUS']) || empty($_SERVER['REQUEST_URI'])) {`

#### Шаг 2
Закомментируйте этот блок кода:
````
if (!preg_match( '/\/('. $directory . '\/)?(data|BGM)\//', $path)) {
		Debug::write('Forbidden directory, you can just access files located in data and BGM folder.', 'error');
		Debug::output();
	}
````

Чтобы получилось так:

````
	// if (!preg_match( '/\/('. $directory . '\/)?(data|BGM)\//', $path)) {
	// 	Debug::write('Forbidden directory, you can just access files located in data and BGM folder.', 'error');
	// 	Debug::output();
	// }
````

#### Шаг 4
1 - app/roBrowser/client/BGM
  - .mp3 файлы вашего сервера

2 - app/roBrowser/client/data
  - Добавьте вашу папку `data` в `./data`.

3 - app/roBrowser/client/resources
  - А в `resources` - полную `data.grf` с настроенным `DATA.INI`.


# Самые используемые команды
#### Запустить docker-compose
docker-compose -f "docker-compose.yaml" up -d --build
#### Остановить docker-compose
docker-compose -f "docker-compose.yaml" down
#### Настроить эмулятор
"./configure && make clean && make server" или "./configure && make clean && make sql"
#### Запустить эмулятор
"./athena-start start"
#### Запустить прокси
"wsproxy -a serve:6900,serve:6121,serve:5121"

Примечания:
````
	1 - После выполнения команд просто откройте браузер по адресу http://localhost:8080/
	2 - Современные браузеры применяют строгие политики безопасности, и WebSocket-соединения должны устанавливаться через защищенные URL (WSS), когда основная страница загружена по HTTPS. Используйте ROBrowser на том же сервере, что и эмулятор, для облегчения коммуникации.
	3 - Проверьте ваше соединение с помощью websocat. Попробуйте установить его, используя `cargo install websocat`, и выполните команду, например: "websocat ws://websocket.example.com:5999/127.0.0.1:690"
````

# Полезные команды
 - docker exec -i -t serve-ragnarok /bin/bash
 - ./entrypoint.sh
 - ./configure && make clean && make server
 - wsproxy -a serve:6900,serve:6121,serve:5121
 - docker-compose -f "docker-compose.yaml" up -d --build
 - wsproxy -a serve:6900,serve:6121,serve:5121 & ./athena-start start
 - mysql -uragnarok -pragnarok;
 - USE ragnarok;
