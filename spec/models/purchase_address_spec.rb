require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '商品の購入ができる場合' do
      it '全項目が入力されていれば出品できる' do
        expect(@purchase_address).to be_valid
      end

      it '建物名が入力されていなくても購入できる' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品の購入ができない場合' do

      it 'ユーザーIDがなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品IDがなければ購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号がなければ購入できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフン - がなければ購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県がなければ購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村がなければ購入できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地がなければ購入できない' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号がなければ購入できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が11桁より多いと購入できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it '電話番号は数字以外だと購入できない' do
        @purchase_address.phone_number = '03-123-4567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end

      it '電話番号は全角数字では購入できない' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end

    end
  end
end
