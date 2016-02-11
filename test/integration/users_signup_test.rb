require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
	
	test "invalid signup information" do
		get signup_path
		assert_no_difference 'User.count' do
			post users__path, user: { name: "",
															email: "user@invalid",
															password: "foo",
															password_confirmation: "bar" }
		end
	end

	test "valid signup information" do
		get signup_path
		name = "Example User"
		email = "user@example.com"
		password = "password"
		# Assert the valid signup
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: {
				name: name,
				email: email,
				password: password,
				password_confirmation: password
			}
		end
		assert_template 'users/show'
	end
end
