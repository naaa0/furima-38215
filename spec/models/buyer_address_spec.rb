require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        expect(@buyer_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できない' do
        @buyer_address.token = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows(e.g. 123-4567)')
      end
      it 'region_idが空では登録できない' do
        @buyer_address.region_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'region_idに「---」が選択されている場合登録できない' do
        @buyer_address.region_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_number空では保存できないこと' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phoneが空では保存できないこと' do
        @buyer_address.phone = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが10桁未満では保存できないこと' do
        @buyer_address.phone = '123456'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone is too short (minimum is 10 characters)')
      end
      it 'phoneが12桁以上では保存できないこと' do
        @buyer_address.phone = '123456789101'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end
      it 'phoneが半角数値以外では保存できないこと' do
        @buyer_address.phone = '123-4567-8910'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone is invalid. Input only number')
      end
      it 'user_idが空では購入できないこと' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できないこと' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
