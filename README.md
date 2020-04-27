## Deployment

```bash
# 拉取代码
git clone -b missevan-shop https://github.com/xchenhao/mini_shop.git
cd mini_shop/

composer install
git reset --hard

# 执行 sql/misevan-shop.sql

# 更改配置
cp config/database{_bac,}.php
cp config/config{_bac,}.php

# 运行
cd public/
php -S 0.0.0.0:8888
```
