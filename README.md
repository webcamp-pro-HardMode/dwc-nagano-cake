# Nagano Cake チーム→HardMode
チーム開発で作成したECサイト RubyOnRailsを中心に作成

#設計（ER図）
![ER.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1514036/fa2c4ea6-7a2e-9822-5b2a-5cec5827aeb5.png)

#アプリケーション詳細設計
##管理者
![管理者詳細設計.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1514036/bdbc2f28-2c4d-58ba-11a3-51467551fe64.png)

##会員
![会員詳細設計.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1514036/ea95cdd4-0d35-a8ba-b8c2-e8cf889d392e.png)


#使用したgem

```
gem 'devise'
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"
gem 'kaminari','~> 1.2.1'
gem 'bootstrap', '~> 4.5'
gem 'jquery-rails'
gem 'font-awesome-sass', '~> 5.13'
gem 'rubocop'
gem 'jp_prefecture'

# Railsを日本語で使うgem
gem 'rails-i18n', '~> 5.1'

```