require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空だと登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Name translation missing: ja.activerecord.errors.models.user.attributes.name.blank'
    end
    it 'child_nameが空だと登録できない' do
      @user.child_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Child name translation missing: ja.activerecord.errors.models.user.attributes.child_name.blank'
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email translation missing: ja.activerecord.errors.models.user.attributes.email.blank'
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password translation missing: ja.activerecord.errors.models.user.attributes.password.blank'
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password confirmation translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation'
    end
  end
end
