require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーの新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

   it "全項目が入力されていれば登録できる" do
    expect(@user).to be_valid
   end

   it "nicknameが空だと登録できない" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
   end

   it "emailが空だと登録できない" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
   end


   it "重複したemailが存在する場合登録できない" do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
   end

   it "passwordが空だと登録できない" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it 'password:半角英数混合(半角英語のみ)であれば登録できる' do
    @user.password = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
  end


   it "passwordが6文字以上であれば登録できる" do
    @user.password = "123abc"
    @user.password_confirmation = "123abc"
    expect(@user).to be_valid
   end

   it "passwordが5文字以下であれば登録できない" do
    @user.password = "123ab"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end

   it "passwordとpassword_confirmationが不一致では登録できない" do
    @user.password = "123abc"
    @user.password_confirmation = "abc123"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

   it "family_nameが空だと登録できない" do
    @user.family_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
   end

   it "family_nameが全角日本語でないと登録できない" do
    @user.family_name = "ﾔﾏﾀﾞ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
   end

   it "given_nameが空だと登録できない" do
    @user.given_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Given name can't be blank")
   end

   it "given_nameが全角日本語でないと登録できない" do
    @user.given_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include("Given name 全角文字を使用してください")
    end
  

   it "family_name_kanaが空だと登録できない" do
    @user.family_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana can't be blank")
   end

   it "family_name_kanaが全角カタカナでないと登録できない" do
    @user.family_name_kana = "やまだ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana 全角カナを使用してください")
   end

   it "given_name_kanaが空だと登録できない" do
    @user.given_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Given name kana can't be blank")
   end

   it "given_name_kanaが全角カタカナでないと登録できない" do
    @user.given_name_kana = "たろう"
    @user.valid?
    expect(@user.errors.full_messages).to include("Given name kana 全角カナを使用してください")
   end

   it "birthdayが空だと登録できない" do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
   end

   
  end
end
