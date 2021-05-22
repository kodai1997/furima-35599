require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品' do
  context '商品出品がうまくいくとき' do
    it "imageとname、descriptionとcategory_id、status_idとshipping_cost、prefectureとshipping_daysとpriceが存在すれば登録できる" do
      expect(@item).to be_valid
    end
    it "販売価格が半角数字であれば保存可能" do
      @item.price = '3456'
      expect(@item).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it "nameが空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "descriptionが空だと登録できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが1だと登録できない" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "status_idが1だと登録できない" do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it "shipping_costが1だと登録できない" do
      @item.shipping_cost_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
    end
    it "prefectureが1だと登録できない" do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "shipping_daysが1だと登録できない" do
      @item.shipping_days_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
    end
    it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格が半角数字以外は保存ができない" do
      @item.price = '２３４５６'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "販売価格が300円以下は保存ができない" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "販売価格が10000000円以上は保存ができない" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
   end
 end
end
