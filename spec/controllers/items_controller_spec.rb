# 以下、現状エラーが発生するコード
require 'rails_helper'
require 'invalid_item'

describe ItemsController do
  describe 'POST #create' do
    context "@itemが保存できた時" do
      before do
        @item = attributes_for(:item)
      end
      it "データベースに値が保存される" do
        expect{
          post :create, params: { item: @item }
        }.to change(Item, :count).by(1)
      end
      it "正しいビューに変遷する" do
        expect(response).to redirect_to items_path
      end
    end
  
    context "@itemが保存できなかった時" do
      before do
        @invalid_item = attributes_for(:invalid_item)
      end
      it "データベースに値が保存されない" do
        expect{
          post :create, params: { item: @invalid_item }
        }.not_to change(Item, :count)
      end
      it "正しいビューに変遷する" do
        expect(response).to redirect_to new_item_path 
      end
    end  
  end
end