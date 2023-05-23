<?php
$CONFIG = array (
  'instanceid' => 'XXXXXXXXXXXXXX',
  'passwordsalt' => '/XXXXXXXXX/s+XXXX/XXXXXXX',
  'secret' => 'XXXXXXX/XXXXXXXXXXXXXX/XXXXXXXXXX',
  'trusted_domains' =>
   [
    '10.1.1.203:9901',  //可信任域名 可以不带端口
    'XXXX.XXXX.leiyanhui.com',
    'XXXXXXXXXXX.eu.org',
    '[2001:db8::1]'
  ],
  'overwriteprotocol' => 'http', //如果要开启后https 或者反向代理https 这里都要修改成https
  'datadirectory' => '/www/wwwroot/nextcloud.com/data',  //数据库储存目录，可以挪走，也可以直接在 用户名/files 位置 ln一个软连接
  'dbtype' => 'mysql',
  'version' => '26.0.1.1',
  'overwrite.cli.url' => 'http://10.1.1.203:9901',  //这个如果走反向代理最好修改了实际的url
  'dbname' => 'nextcloud',
  'dbhost' => 'localhost',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'XXXXXXXXXXXXXXXXXX', //数据库密码
  'installed' => true,
  'default_phone_region' => 'CN',
  'filesystem_check_changes' => true,
  'localstorage.allowsymlinks' => true,
  'memcache.local' => '\\OC\\Memcache\\Redis',  //没用Memcached而且是用的Memcache和redis
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'filelocking.enabled' => 'true',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'redis' =>  //如果有密码，添加password 也可以指定db 也可以 sock
  array (
    'host' => '127.0.0.1',
    'port' => 6379, 
  ),
  'mail_from_address' => 'XXXXX', //邮箱部分配置，这部分后台配置也可以，会复写这里
  'mail_smtpmode' => 'smtp',
  'mail_sendmailmode' => 'smtp',
  'mail_domain' => 'qq.com',
  'mail_smtpsecure' => 'ssl',
  'mail_smtphost' => 'smtp.qq.com',
  'mail_smtpport' => '465',
  'mail_smtpauth' => 1,
  'mail_smtpname' => 'XXXXX@qq.com',
  'mail_smtppassword' => 'XXXXXXXXXXXXXXXX',
);
