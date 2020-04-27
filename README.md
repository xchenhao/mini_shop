## Deployment

```bash
git clone -b missevan-shop https://github.com/xchenhao/mini_shop.git
cd mini_shop

composer install
git reset --hard

cp config/database{_bac,}.php
cp config/config{_bac,}.php
```
