<?php
$cfg['Servers'][1]['host'] = 'mariadb';
$cfg['Servers'][1]['port'] = '3306';
$cfg['Servers'][1]['auth_type'] = 'cookie';
$cfg['blowfish_secret'] =  getenv('PMA_BLOWFISH_SECRET');