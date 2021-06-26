require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaganoCake
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # タイムゾーン日本へ設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone (:local)
    
    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja
    # 複数のローケルファイルが読み込まれるようにする
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
