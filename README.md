■サービス名
電子レシピ

■サービス概要
日々のキッチンに立つ時間を短縮することにより、自由に使える時間を増やすことに特化したレシピ提案・共有サービスです。
生成AIを活用して手持ちの食材を使用した電子レンジ調理のレシピが生成され、料理名からは電子レンジでの調理手順が生成されます。

■ このサービスへの思い・作りたい理由
プログラミング学習中、資格取得の勉強中、机に向かう時間を大幅に増やしてくれたのが電子レンジでした。
品数を多くするとどうしても時間がかかる、時短調理のために高額な調理器具を購入するのはちょっと・・・という悩みがありました。
とあるレシピを目にしてびっくり、家にある電子レンジ1つでこんな料理もできるんだと気づかせてくれました。
このような体験から、電子レンジを使ったレシピだけを提案してくれるアプリケーションがあったらいいのに、と思ったことがきっかけで制作を決めました。

■ ユーザー層について
主体的に家事をする、リスキリングや資格取得のため学習中で、なるべく机に向かう時間を確保したい方
性別：
年齢：
収入：
独身／既婚：
習慣：
趣味：
嗜好：
価値観：

■サービスの利用イメージ
ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。

■ ユーザーの獲得について
LINEでの共有機能(ユーザー間で直接紹介するのであれば一番使われるであろうサービス)
Twitterでの共有機能(プログラミング学習している方、資格取得を目指している方が利用していることが多い)
知人づてに口コミで紹介を獲得していく

■ サービスの差別化ポイント・推しポイント
似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。
独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。

レシピサイトには多種多様なレシピが載っていますが、大体はキッチンに立って調理をする、一定の時間その場に居て作業することが確定してしまうことが多いです。
電子レシピの場合は確実に電子レンジのみを使用して調理するレシピのみが生成・共有されているため、
・下ごしらえ後はにキッチンにいる必要がない
・洗い物が少ない(加熱に使用するのは耐熱ボウルや耐熱皿のみ)
・調理時間が計算できる(電子レンジは加熱時間を指定できるため)

■ 機能候補
MVPリリース時に作っていたいもの
・ユーザー登録機能
・ログイン機能
・アプリケーションのトップ画面
・レシピ生成機能(食材を指定して生成)
・レシピ一覧機能
・レシピ詳細機能
・レシピ共有機能
・レシピ検索機能
・レシピのピン留め機能
・レシピの閲覧履歴参照機能
・作成済みレシピの評価機能
・作成済みレシピからランダムで提案機能

本リリースまでに作っていたいもの
・レシピ生成機能(料理名を指定して生成)
・自作レシピ投稿機能
・LINE公式アカウントの運用

■ 機能の実装方針予定
一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。
・生成AIはopenAIのAPIを使用して実装を考えております。
・検索機能はform objectもしくはconcern等を用いて実装したいと考えております。
・レシピ生成時の入力フォームにオートコンプリートを実装したいと考えております。
・ログインと通知機能にLINEを使用したいと考えております。
・Twitterへの共有機能を実装したいと考えております。