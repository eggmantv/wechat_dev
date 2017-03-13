## 微信开发环境搭建

nginx.conf:

```shell
server {
    listen 80;
    server_name wechat-test1.eggman.tv;
    location / {
       proxy_set_header  Host               $host;
       proxy_set_header  X-Forwarded-Host   $host;
       proxy_set_header  X-Forwarded-Server $host;
       proxy_set_header  X-Real-IP          $remote_addr;
       proxy_set_header  X-Forwarded-For    $proxy_add_x_forwarded_for;
       proxy_buffering                      on;
       proxy_pass                           http://localhost:8180;
   }
}
```

ssh tunnel:

```shell
$ssh root@0.0.0.0 -N -R 8180:0.0.0.0:3002
```
