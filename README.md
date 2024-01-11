# My Nomad Cluster
なぜNomadのクラスタを構築するに至ったのか、どのような要件を満たすために構築したのか。また、Nomadクラスタの現状の課題についてまとめる。
## 構築のモチベーション
- 様々なOSSと出会い、それらを検証する基盤が必要だった。
- 1ノードのDockerサーバーなどでは可用性に問題があり、サービスを立ち上げたいときにすぐに立ち上げられない可能性がある。
- コンテナのスケーリングなど、コンテナオーケストレーションを学びたかった。

## システムの要件
- 思い立ったらすぐにサービスを立ち上げられる、フットワークの軽いシステムであること。
- 常時稼働が必要なサービスを立ち上げることは想定せず、サービスの検証を妨げない程度の可用性があること。
- 基盤のメンテナンスが容易であること。

## 選定
- 