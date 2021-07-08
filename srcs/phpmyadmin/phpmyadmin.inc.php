<?php

$cfg['blowfish_secret'] = '0123456789876543210123456789876543210';

// Определяю настройки для первого (и единственного) сервера
$i = 0;
$i++;

// Сookie-аутентификация
$cfg['Servers'][$i]['auth_type'] = 'cookie';

// Имя хоста или IP адрес $i-го MySQL-сервера
$cfg['Servers'][$i]['host'] = 'mysql-service:3306';

// Использовать ли сжатый протокол для соединения MySQL сервера или нет
$cfg['Servers'][$i]['compress'] = false;

$cfg['Servers'][$i]['user'] = 'admin';
$cfg['Servers'][$i]['password'] = 'admin';

// Разрешает попытку авторизироваться без пароля, в случае неудачной авторизации с использованием пароля
$cfg['Servers'][$i]['AllowNoPassword'] = true;

// Имя директории, куда будут загружены SQL файлы
$cfg['UploadDir'] = '';

// Имя директории куда будут сохраняться дампы
$cfg['SaveDir'] = '';
$cfg['TempDir'] = '/tmp';

?>