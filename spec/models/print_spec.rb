require 'rails_helper'

RSpec.describe Print, type: :model do
  before do
    @print = FactoryBot.build(:print)
  end

  describe 'お知らせの保存' do
    context 'お知らせが投稿できる場合' do
      it 'タイトルとテキストと画像があれば投稿できる' do
        expect(@print).to be_valid
      end
      it 'タイトルとテキストがあれば投稿できる' do
        @print.image = ''
        expect(@print).to be_valid
      end
    end
    context 'お知らせが投稿できない場合' do
      it 'タイトルが空では投稿できない' do
        @print.title = ''
        @print.valid?
        expect(@print.errors.full_messages).to include('Title translation missing: ja.activerecord.errors.models.print.attributes.title.blank')
      end
      it 'テキストが空では投稿できない' do
        @print.text = ''
        @print.valid?
        expect(@print.errors.full_messages).to include('Text translation missing: ja.activerecord.errors.models.print.attributes.text.blank')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @print.user = nil
        @print.valid?
        expect(@print.errors.full_messages).to include('User translation missing: ja.activerecord.errors.models.print.attributes.user.required')
      end
    end
  end
end
