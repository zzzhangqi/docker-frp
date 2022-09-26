## frp Docker

### Usage

1. start frp server

```bash
docker run --net host --name frp-server -d qlucky/frp:0.44.0 server
```

2. start frp client

```bash
docker run --net host --name frp-client -d qlucky/frp:0.44.0 client
```

3. Profile

Example: 

```bash
docker run --net host --name frp-client -v ~/frp/frpc.ini:/app/frp/frpc.ini -d qlucky/frp:0.44.0 client
```