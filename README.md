# widget_sampling
flutter ウィジェットサンプリング

## アプリ構成
```bash
lib/
├── core/                     # アプリ全体で共有する機能や定義
│   ├── errors/               # エラーハンドリング関連
│   └── utils/                # ユーティリティクラスや関数
├── features/                 # 機能ごとのディレクトリ
│   └── feature_name/         # 各機能（例：ユーザー認証、商品管理など）
│       ├── data/             # データ層
│       │   ├── models/       # データモデル
│       │   ├── datasources/  # データソース（APIやローカルデータ）
│       │   └── repositories/ # リポジトリの実装
│       ├── domain/           # ドメイン層
│       │   ├── entities/     # ビジネスロジックのエンティティ
│       │   └── repositories/ # リポジトリのインターフェース
│       └── presentation/     # プレゼンテーション層
│           ├── views/        # UIウィジェット
│           └── viewmodels/   # 状態管理やロジック
└── main.dart                 # アプリのエントリーポイント

```