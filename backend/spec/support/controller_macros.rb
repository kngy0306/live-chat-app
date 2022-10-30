module ControllerMacros
  def login_user
    before do
      @request.env["device.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      user.confirm!
      sign_in user
    end
  end
end