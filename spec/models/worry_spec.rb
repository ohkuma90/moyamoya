require 'rails_helper'

RSpec.describe Worry, type: :model do
  before do
    @worry = FactoryBot.build(:worry)
  end

  describe 'モヤモヤの保存' do
    context 'モヤモヤの保存ができる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@worry).to be_valid
      end
    end

    context 'モヤモヤの保存ができない場合' do
      it 'textが空では保存できない' do
        @worry.text = ''
        @worry.valid?
        expect(@worry.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空では保存できない' do
        @worry.category_id = ''
        @worry.valid?
        expect(@worry.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では保存できない' do
        @worry.category_id = 1
        @worry.valid?
        expect(@worry.errors.full_messages).to include("Category can't be blank")
      end
      it 'titleが空では保存できない' do
        @worry.title = ''
        @worry.valid?
        expect(@worry.errors.full_messages).to include("Title can't be blank")
      end
    end
  end
end
