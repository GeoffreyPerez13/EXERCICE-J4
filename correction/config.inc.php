<?php
$cfg['blowfish_secret'] = 'MySecretSentence125478*'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */
$i=1;
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = 'mysqldb';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['TempDir']= '/usr/src/phpmyadmin/tmp/';

