# Railsアプリケーションの作成
docker compose run --rm web rails _7.1.3.2_ new . -d=postgresql -T -j=esbuild

Gemfile/y
Dockerfile/n

# database.ymlの編集

# Procfile.devの編集

# コンテナのビルド
docker compose build

# コンテナの起動
docker compose up

# データベースの作成と初回マイグレーション
docker compose exec web bin/rails db:create db:migrate

# Gemfileの更新
gem 'cssbundling-rails'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'launchy'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
end

# bundle installの実行
docker compose exec web bundle install

# .rubocop.ymlファイルの作成と編集
# This file overrides https://github.com/bbatsov/rubocop/blob/master/config/default.yml
require:
  - rubocop-rails

AllCops:
  Exclude:
    - "vendor/**/*"
    - "db/**/*"
    - "bin/**/*"
    - "lib/**/*"
    - "spec/**/*"
    - "config/**/*"
    - "app/validators/attachment_validator.rb"
    - "node_modules/**/*"
    - "Gemfile"
  DisplayCopNames: true

Rails:
  Enabled: true

Metrics/AbcSize:
  Max: 30

Metrics/ClassLength:
  CountComments: false
  Max: 300

Metrics/CyclomaticComplexity:
  Max: 30

Metrics/LineLength:
  Enabled: false

Metrics/MethodLength:
  CountComments: false
  Max: 30

Naming/AccessorMethodName:
  Exclude:
    - "app/controllers/**/*"

Style/AsciiComments:
  Enabled: false

Style/ClassAndModuleChildren:
  Enabled: false

Style/Documentation:
  Enabled: false

Style/FrozenStringLiteralComment:
  Enabled: false

Style/IfUnlessModifier:
  Enabled: false

Style/WhileUntilModifier:
  Enabled: false

Style/ExpandPathArguments:
  Enabled: false

Style/HashSyntax:
  Enabled: false

Rails/HasManyOrHasOneDependent:
  Enabled: false

Rails/UniqueValidationWithoutIndex:
  Enabled: false

Gemspec/DeprecatedAttributeAssignment:
  Enabled: true
Gemspec/RequireMFA:
  Enabled: true
Layout/LineContinuationLeadingSpace:
  Enabled: true
Layout/LineContinuationSpacing:
  Enabled: true
Layout/LineEndStringConcatenationIndentation:
  Enabled: true
Layout/SpaceBeforeBrackets:
  Enabled: true
Lint/AmbiguousAssignment:
  Enabled: true
Lint/AmbiguousOperatorPrecedence:
  Enabled: true
Lint/AmbiguousRange:
  Enabled: true
Lint/ConstantOverwrittenInRescue:
  Enabled: true
Lint/DeprecatedConstants:
  Enabled: true
Lint/DuplicateBranch:
  Enabled: true
Lint/DuplicateMagicComment:
  Enabled: true
Lint/DuplicateRegexpCharacterClassElement:
  Enabled: true
Lint/EmptyBlock:
  Enabled: true
Lint/EmptyClass:
  Enabled: true
Lint/EmptyInPattern:
  Enabled: true
Lint/IncompatibleIoSelectWithFiberScheduler:
  Enabled: true
Lint/LambdaWithoutLiteralBlock:
  Enabled: true
Lint/NoReturnInBeginEndBlocks:
  Enabled: true
Lint/NonAtomicFileOperation:
  Enabled: true
Lint/NumberedParameterAssignment:
  Enabled: true
Lint/OrAssignmentToConstant:
  Enabled: true
Lint/RedundantDirGlobSort:
  Enabled: true
Lint/RefinementImportMethods:
  Enabled: true
Lint/RequireRangeParentheses:
  Enabled: true
Lint/RequireRelativeSelfPath:
  Enabled: true
Lint/SymbolConversion:
  Enabled: true
Lint/ToEnumArguments:
  Enabled: true
Lint/TripleQuotes:
  Enabled: true
Lint/UnexpectedBlockArity:
  Enabled: true
Lint/UnmodifiedReduceAccumulator:
  Enabled: true
Lint/UselessRuby2Keywords:
  Enabled: true
Naming/BlockForwarding:
  Enabled: true
Security/CompoundHash:
  Enabled: true
Security/IoMethods:
  Enabled: true
Style/ArgumentsForwarding:
  Enabled: true
Style/CollectionCompact:
  Enabled: true
Style/DocumentDynamicEvalDefinition:
  Enabled: true
Style/EmptyHeredoc:
  Enabled: true
Style/EndlessMethod:
  Enabled: true
Style/EnvHome:
  Enabled: true
Style/FetchEnvVar:
  Enabled: true
Style/FileRead:
  Enabled: true
Style/FileWrite:
  Enabled: true
Style/HashConversion:
  Enabled: true
Style/HashExcept:
  Enabled: true
Style/IfWithBooleanLiteralBranches:
  Enabled: true
Style/InPatternThen:
  Enabled: true
Style/MagicCommentFormat:
  Enabled: true
Style/MapCompactWithConditionalBlock:
  Enabled: true
Style/MapToHash:
  Enabled: true
Style/MultilineInPatternThen:
  Enabled: true
Style/NegatedIfElseCondition:
  Enabled: true
Style/NestedFileDirname:
  Enabled: true
Style/NilLambda:
  Enabled: true
Style/NumberedParameters:
  Enabled: true
Style/NumberedParametersLimit:
  Enabled: true
Style/ObjectThen:
  Enabled: true
Style/OpenStructUse:
  Enabled: true
Style/OperatorMethodCall:
  Enabled: true
Style/QuotedSymbols:
  Enabled: true
Style/RedundantArgument:
  Enabled: true
Style/RedundantInitialize:
  Enabled: true
Style/RedundantSelfAssignmentBranch:
  Enabled: true
Style/RedundantStringEscape:
  Enabled: true
Style/SelectByRegexp:
  Enabled: true
Style/StringChars:
  Enabled: true
Style/SwapValues:
  Enabled: true
Rails/ActionControllerFlashBeforeRender:
  Enabled: true
Rails/ActionControllerTestCase:
  Enabled: true
Rails/ActionOrder:
  Enabled: false
Rails/ActiveRecordCallbacksOrder:
  Enabled: true
Rails/ActiveSupportOnLoad:
  Enabled: true
Rails/AddColumnIndex:
  Enabled: true
Rails/AfterCommitOverride:
  Enabled: true
Rails/AttributeDefaultBlockValue:
  Enabled: true
Rails/CompactBlank:
  Enabled: true
Rails/DeprecatedActiveModelErrorsMethods:
  Enabled: false
Rails/DotSeparatedKeys:
  Enabled: true
Rails/DuplicateAssociation:
  Enabled: true
Rails/DuplicateScope:
  Enabled: true
Rails/DurationArithmetic:
  Enabled: true
Rails/EagerEvaluationLogMessage:
  Enabled: true
Rails/ExpandedDateRange:
  Enabled: true
Rails/FindById:
  Enabled: true
Rails/FreezeTime:
  Enabled: true
Rails/I18nLazyLookup:
  Enabled: true
Rails/I18nLocaleAssignment:
  Enabled: true
Rails/I18nLocaleTexts:
  Enabled: false
Rails/IgnoredColumnsAssignment:
  Enabled: true
Rails/Inquiry:
  Enabled: true
Rails/MailerName:
  Enabled: true
Rails/MatchRoute:
  Enabled: true
Rails/MigrationClassName:
  Enabled: true
Rails/NegateInclude:
  Enabled: true
Rails/Pluck:
  Enabled: true
Rails/PluckInWhere:
  Enabled: true
Rails/RedundantPresenceValidationOnBelongsTo:
  Enabled: true
Rails/RedundantTravelBack:
  Enabled: true
Rails/RenderInline:
  Enabled: true
Rails/RenderPlainText:
  Enabled: true
Rails/RootJoinChain:
  Enabled: true
Rails/RootPathnameMethods:
  Enabled: true
Rails/RootPublicPath:
  Enabled: true
Rails/ShortI18n:
  Enabled: true
Rails/SquishedSQLHeredocs:
  Enabled: true
Rails/StripHeredoc:
  Enabled: true
Rails/TimeZoneAssignment:
  Enabled: true
Rails/ToFormattedS:
  Enabled: true
Rails/ToSWithArgument:
  Enabled: true
Rails/TopLevelHashWithIndifferentAccess:
  Enabled: true
Rails/TransactionExitStatement:
  Enabled: false
Rails/UnusedIgnoredColumns:
  Enabled: true
Rails/WhereEquals:
  Enabled: true
Rails/WhereExists:
  Enabled: true
Rails/WhereMissing:
  Enabled: true
Rails/WhereNot:
  Enabled: true
Rails/WhereNotWithMultipleConditions:
  Enabled: true

# RSpecのインストール
docker compose exec web bin/rails g rspec:install

# .rspecファイルの編集
--format documentation

# spec/rails_helper.rbで以下の行のコメントアウトを解除
sed -i "s/^# \(Rails.root.glob('spec\/support\/\*\*\/\*.rb').sort.each { \|f\| require f }\)/Rails.root.glob('spec\/support\/\*\*\/\*.rb').sort.each { \|f\| require f }/" spec/rails_helper.rb

# spec/support/capybara.rbの作成と編集
mkdir -p spec/support
cat <<EOT > spec/support/capybara.rb
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end
end
EOT

# spec/rails_helper.rbの編集
config.include FactoryBot::Syntax::Methods

# config/application.rbの編集
config.generators do |g|
  g.test_framework :rspec,
    view_specs: false,
    helper_specs: false,
    routing_specs: false,
    controller_specs: true,
    request_specs: false
end

# TOPページの作成
docker compose exec web bin/rails g controller StaticPages top

# routes.rbの編集
root 'static_pages#top'

# static_pages/topの編集

# Gitリポジトリの初期化とコミット
git init
git add -A
git commit -m 'プロジェクトのセットアップ完了'