require 'rails_helper'

RSpec.describe "Auth::Registrations", type: :controller do
  describe "ユーザ登録" do
    it 'ページにアクセスできること' do
      user = build(:user)
      get "/messages"
      expect(response.status).to eq(200)
    end
  end
end
