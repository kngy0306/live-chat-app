require 'rails_helper'

RSpec.describe Message, type: :request do
  describe "/messages" do
    context "認証をしていない場合" do
      it "返り値のstatusが400であること" do
        get "/messages"
        expect(response.status).to eq(401)
      end
    end
  end
end
