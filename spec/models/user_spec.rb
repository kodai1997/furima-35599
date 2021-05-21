require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,family_nameとfirst_name,famili_name_kanaとfirst_name_kane,birth_dateが存在すれば登録できる' do
       expect(@user).to be_valid
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力であれば登録できる' do
       @user.name = '竹だコ'
       expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の半角英数字混合であれば登録できる' do
       @user.password = 'aaaaaa1'
       @user.password_confirmation = 'aaaaaa1'
       expect(@user).to be_valid
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.family_name = '手すト'
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = '手すト'
        expect(@user).to be_valid
      end
      it "family_name_kanaは全角（カタカナ）であれば登録できる" do
        @user.family_name_kana = 'テスト'
        expect(@user).to be_valid
      end
      it "first_name_kaneは全角（カタカナ）であれば登録できる" do
        @user.first_name_kane = 'テスト'
        expect(@user).to be_valid
      end
    end  
  context '新規登録できないとき' do
    it "nameが空だと登録できない" do
      @user.name = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "family_nameが空では登録できない" do
      @user.family_name = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空では登録できない" do
      @user.family_name_kana = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kaneが空では登録できない" do
      @user.first_name_kane = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("First name kane can't be blank")
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = ''
      @user.valid?
       expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it "family_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.family_name = '000'
      @user.valid?
       expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
    end
    it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = '000'
      @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it "family_name_kanaは全角（カタカナ）でなければ登録できない" do
      @user.family_name_kana = 'てすと'
      @user.valid?
       expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
    end
    it "first_name_kaneは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kane = 'てすと'
      @user.valid?
       expect(@user.errors.full_messages).to include("First name kane is invalid. Input full-width katakana characters.")
    end
    it "emailは@なしでは登録できない" do
      @user.email = 'testtest'
      @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailは登録済みのメールアドレスは登録できない"do
      user1 = FactoryBot.create(:user, email: 'test@test')
      user2 = FactoryBot.build(:user, email: 'test@test')
      user2.valid?
       expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが全角のみだと登録できない" do
      @user.password = '１２３４５６s'
      @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが半角数字のみだと登録できない" do
      @user.password = '1234567'
      @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが半角英字のみだと登録できない" do
      @user.password = 'abcdef'
      @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードは、5文字以下では登録できないこと" do
      @user.password = 'abcd1'
      @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）、値が一致していなければ登録できないこと" do
      @user.password = 'abcdef1'
      @user.password_confirmation = 'aaaaaa1'
      @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_name_kanaは半角文字だと登録できないこと" do
      @user.family_name_kana = 'ﾃｽﾄ'
      @user.valid?
       expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
    end
    it "first_name_kanaは半角文字だと登録できないこと" do
      @user.first_name_kane = 'ﾃｽﾄ'
      @user.valid?
       expect(@user.errors.full_messages).to include("First name kane is invalid. Input full-width katakana characters.")
    end
  end
end
end

