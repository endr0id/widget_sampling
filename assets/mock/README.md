# 概要
OpenAPI + Prism  

VSCode拡張: Swagger Viewer

## dir構成
各apiの情報は/api配下にディレクトリを作成し用意

openapi.yamlはパス参照で読み込む  
参照時は以下の様に記載
```yaml
paths:
  /todo:
    # ~1 は / をエスケープする記号
    $ref: "./api/todo/todo.yaml#/paths/~1todo"
```

## モックサーバー起動

通常の起動
```sh
prism mock openapi.yaml
```

APIレスポンスをランダムで生成
```sh
prism mock openapi.yaml --dynamic
```