### Deployment

```shell
git clone -b miaozilla https://github.com/xchenhao/mini_shop.git

cd miaozilla

docker build -t miaozilla:0.0.1 .

docker run --rm -d -p 8081:80 miaozilla:0.0.1

curl http://127.0.0.1:8081
```
