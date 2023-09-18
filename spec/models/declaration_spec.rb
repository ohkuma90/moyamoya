require 'rails_helper'

RSpec.describe Declaration, type: :model do
  before do
    @declaration = FactoryBot.build(:declaration)
  end

  describe '宣言の保存' do
    context '宣言 の保存ができる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@declaration).to be_valid
      end
    end

    context '宣言の保存ができない場合' do
      it 'declarationが空では保存できない' do
        @declaration.declaration = ''
        @declaration.valid?
        expect(@declaration.errors.full_messages).to include("Declaration can't be blank")
      end
      it 'commentが空では保存できない' do
        @declaration.comment = ''
        @declaration.valid?
        expect(@declaration.errors.full_messages).to include("Comment can't be blank")
      end
    end
  end
end
