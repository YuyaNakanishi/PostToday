require 'rails_helper'

RSpec.describe Fashion, type: :model do
  it 'タイトルとイメージが入力されていれば記事を投稿できる' do
    user = User.create!({
      email: 'test@gmail.com',
      password: 'password'
    })
    fashion = user.fashions.build({
      name: 'テスト'
    })

    expect(fashion).to be_valid
  end
end

