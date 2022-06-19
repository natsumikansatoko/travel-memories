# frozen_string_literal: true

require 'rails_helper'

describe 'バリデーションのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot,build(:memory)).to be_valid
  end
end