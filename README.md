# widget_sampling
flutter ウィジェットサンプリング

## アプリ構成
```bash
lib/
├── core/                     # アプリ全体で共有する機能や定義
│   ├── errors/               # エラーハンドリング関連
│   ├── constants/            # 定数関連
│   └── utils/                # ユーティリティクラスや関数
│
├── shared/                   # 共通機能ごとのディレクトリ
│   └── shared_name/          # 共通機能（例：AppBarなど）
│       ├── data/             # data/配下以降はfeatures/と同一
│       ├── domain/           # domain/配下以降はfeatures/と同一
│       └── presentation/     # presentation/配下以降はfeatures/と同一
│
├── features/                 # 機能ごとのディレクトリ
│   └── feature_name/         # 各機能（例：ユーザー認証、商品管理など）
│       ├── data/             # データ層
│       │   ├── models/       # データモデル
│       │   ├── datasources/  # データソース（APIやローカルデータ）
│       │   └── repositories/ # リポジトリの実装
│       ├── domain/           # ドメイン層
│       │   ├── entities/     # ビジネスロジックのエンティティ
│       │   ├── usecases/     # ビジネスロジックの処理
│       │   └── repositories/ # リポジトリのインターフェース
│       └── presentation/     # プレゼンテーション層
│           ├── views/        # UIウィジェット
│           └── viewmodels/   # 状態管理やロジック
└── main.dart                 # アプリのエントリーポイント

```