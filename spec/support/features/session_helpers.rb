module Features
  module SessionHelpers

    def sign_up_with(username, email, password)
      visit new_user_registration_path
      fill_in 'user_username',              with: username
      fill_in 'user_email',                 with: email
      fill_in 'user_password',              with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign up'
    end

    def sign_in(user=nil)
      user ||= FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'user_username', with: user.username
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
    end
    
  end
end
