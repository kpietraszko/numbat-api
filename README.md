A very simple REST API that wraps [numbat](https://github.com/sharkdp/numbat), using [adnanh/webhook](https://github.com/adnanh/webhook).

The Docker image size is ~30 MB.

For example: 
```
GET http://localhost:9000/run/numbat?e=2d-1h
```
responds with `1.95833 day`.

*Remember to URL-encode the `e` query param.*
