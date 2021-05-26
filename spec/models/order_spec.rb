require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    item = FactoryBot.create(:item) 
    user = FactoryBot.create(:user) 
    @order = FactoryBot.build(:order)
    @order.item_id = item.id
    @order.user_id = user.id
    sleep 0.1
end

describe '商品購入' do
  context '商品出品がうまくいくとき' do
    it "zip_code,prefecture_id,city,address,telephone,tokenが存在すれば登録できる" do
      expect(@order).to be_valid
    end
    it "郵便番号の保存にはハイフンがあれば保存可能" do
      @order.zip_code = '123-4567'
      expect(@order).to be_valid
    end
    it "電話番号は11桁以内の数値であれば保存可能" do
      @order.telephone = 12345678901
      expect(@order).to be_valid
    end
    it "建物番号は空でも保存可能" do
      @order.address2 = ''
      expect(@order).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it "zip_codeが空だと登録できない" do
      @order.zip_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid. Include hyphen(-)")
    end
    it "zip_codeにハイフンがないと登録できない" do
      @order.zip_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
    it "prefecture_idが1だと登録できない" do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "cityが空だと登録できない" do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空だと登録できない" do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it "telephoneが空だと登録できない" do
      @order.telephone = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone can't be blank")
    end
    it "telephoneが11桁以上だと登録できない" do
      @order.telephone = 123456789012
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone is invalid. Include hyphen(-)")
    end
    it "telephoneが英数混合では登録できないこと" do
      @order.telephone = '123as1234ji'
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone is invalid. Include hyphen(-)")
    end
    it "tokenが空だと登録できない" do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空だと登録できない" do
      @order.user_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空だと登録できない" do
      @order.item_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
   end
 end
end
