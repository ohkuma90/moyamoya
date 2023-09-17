require 'rails_helper'

RSpec.describe Todo, type: :model do
  before do
    @todo = FactoryBot.build(:todo)
  end

  describe 'TODOの保存' do
    context 'TODOの保存ができる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@todo).to be_valid
      end
    end

    context 'モヤモヤの保存ができない場合' do
      it 'textが空では保存できない' do
        @todo.title = ''
        @todo.valid?
        expect(@todo.errors.full_messages).to include("Title can't be blank")
      end
      it 'category_idが空では保存できない' do
        @todo.category_id = ''
        @todo.valid?
        expect(@todo.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では保存できない' do
        @todo.category_id = 1
        @todo.valid?
        expect(@todo.errors.full_messages).to include("Category can't be blank")
      end
      it 'memoが空では保存できない' do
        @todo.memo = ''
        @todo.valid?
        expect(@todo.errors.full_messages).to include("Memo can't be blank")
      end
      it 'priority_idが空では保存できない' do
        @todo.priority_id = ''
        @todo.valid?
        expect(@todo.errors.full_messages).to include("Priority can't be blank")
      end
      it 'priority_idが1では保存できない' do
        @todo.priority_id = 1
        @todo.valid?
        expect(@todo.errors.full_messages).to include("Priority can't be blank")
      end
    end
  end
end
