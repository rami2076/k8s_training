# fluentd sample

# REF

https://qiita.com/bosq/items/85c2543752425eb3df9d

# Test Commands

```bash
docker compose up -d
docker compose logs -f
```

# workaround

## fluentd The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested

https://zenn.dev/okita_kamegoro/scraps/329e8d4c2252c4

### ASIS

```bash
# error command
docker compose up -d
# error message
fluentd The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
```

### TOBE

- https://qiita.com/kk_env/items/43e5ea9a946613be2470
- Docker Composeでplatformを指定する方法で解消
    - まだ以下のエラーが出る
      -
      `Error response from daemon: failed to create task for container: failed to initialize logging driver: dial tcp [::1]:24224: i/o timeout`
        - https://qiita.com/moaikids/items/8a8ee90e163f14e6e923
        - 設定を変更して対応 git のコミットを参照してください

#### その他の対応

- https://zenn.dev/okita_kamegoro/scraps/329e8d4c2252c4
- docker compose -d --platform linux/amd64
