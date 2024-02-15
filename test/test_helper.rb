ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

# gem minitest-reporters setup
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # 並列テスト
  # プロセスが分岐した直後に呼び出し
  parallelize_setup do |worker|
    #seedデータの読み込み
    load "#{Rails.root}/db/seeds.rb"
  end
  # Run tests in parallel with specified workers
  # 並列テストの有効化・無効化
  # workers: プロセス数を渡す（２以上 => 有効、2未満 => 向こう）
  #
  parallelize(workers: :number_of_processors)

  #あくてぃぶなユーザーを返す
  def active_user
    User.find_by(activated: true)
  end

  # Add more helper methods to be used by all tests here...
end
