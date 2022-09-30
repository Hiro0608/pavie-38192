require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname,email,password,password_confirmation,family_name,family_name_kana,first_name,first_name_kana,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end  
    context '新規登録できない場合' do
      it 'ニックネームの欄が空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'Eメールの欄が空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したEメールが存在する場合は登録できない' do
        @user.save 
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'Eメールは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードの欄が空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードとパスワード（確認）が不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードが半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "苗字（漢字）の欄が空の場合は登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family nameを入力してください")
      end
      it "苗字（漢字）に半角文字が含まれていると登録できない" do
        @user.family_name = 'acb123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family nameは不正な値です")
      end
      it "ミョウジ（カナ）の欄が空の場合は登録できない" do
        @user.family_name_kana = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanaを入力してください")
      end
      it "ミョウジ（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.family_name_kana = 'あ愛1$' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanaは不正な値です")
      end
      it "名前（漢字）がない場合は登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください")
      end
      it "名前（漢字）に半角文字が含まれていると登録できない" do
        @user.first_name = 'acb123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameは不正な値です")
      end
      it "ナマエ（カナ）の欄が空の場合は登録できない" do
        @user.first_name_kana = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaを入力してください")
      end
      it "ナマエ（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = 'あ愛1$' 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaは不正な値です")
      end
      it "生年月日の欄が空の場合は登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth dateを入力してください")
      end
    end
  end
end