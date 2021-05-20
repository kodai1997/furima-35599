require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nameが空だと登録できない" do
      user = User.new(name: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "試験", first_name: "太朗", family_name_kana: "テスト", first_name_kane: "タロウ", birth_date: "1997/10/10")
       user.valid?
       expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(name: "テスト", email: "", password: "00000000", password_confirmation: "00000000", family_name: "試験", first_name: "太朗", family_name_kana: "テスト", first_name_kane: "タロウ", birth_date: "1997/10/10")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(name: "テスト", email: "kkk@gmail.com", password: "", password_confirmation: "", family_name: "試験", first_name: "太朗", family_name_kana: "テスト", first_name_kane: "タロウ", birth_date: "1997/10/10")
       user.valid?
       expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "family_nameが空では登録できない" do
      user = User.new(name: "テスト", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "", first_name: "太朗", family_name_kana: "テスト", first_name_kane: "タロウ", birth_date: "1997/10/10")
       user.valid?
       expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(name: "テスト", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "試験", first_name: "", family_name_kana: "テスト", first_name_kane: "タロウ", birth_date: "1997/10/10")
       user.valid?
       expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空では登録できない" do
      user = User.new(name: "テスト", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "試験", first_name: "太朗", family_name_kana: "", first_name_kane: "タロウ", birth_date: "1997/10/10")
       user.valid?
       expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kaneが空では登録できない" do
      user = User.new(name: "テスト", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "試験", first_name: "太朗", family_name_kana: "テスト", first_name_kane: "", birth_date: "1997/10/10")
       user.valid?
       expect(user.errors.full_messages).to include("First name kane can't be blank")
    end
    it "birth_dateが空では登録できない" do
      user = User.new(name: "テスト", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "試験", first_name: "太朗", family_name_kana: "テスト", first_name_kane: "タロウ", birth_date: "")
      user.valid?
       expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
