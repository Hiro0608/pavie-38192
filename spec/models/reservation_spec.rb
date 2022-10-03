require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before do
    @reservation = FactoryBot.build(:reservation)
  end
  describe '新規投稿登録' do
    context '投稿ができる場合' do
      it "image,title,place,introductionが存在すれば登録できる" do
        expect(@reservation).to be_valid
      end
    end  
    context '投稿ができない場合' do
      it "写真が添付されていないと登録できない" do
        @reservation.image = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Imageを入力してください")
      end
      it "タイトルが入力されていなければ登録できない" do
        @reservation.title = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Titleを入力してください")
      end
      it "場所が入力されていなければ登録できない" do
        @reservation.place = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Placeを入力してください")
      end
      it "投稿の説明が入力されていなければ登録できない" do
        @reservation.introduction = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Introductionを入力してください")
      end
      it "ユーザーが紐付いていない場合は登録できない" do
        @reservation.user = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
