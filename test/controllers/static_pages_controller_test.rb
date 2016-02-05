require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

	# cut the duplicate
	def setup
		@base_title = "Ruby on Rails Tutorial Sample App"
	end

  test "should get home" do
    get :home
    assert_response :success
		#test the page title
		assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
		#test the page title
		assert_select "title", "Help | #{@base_title}"
  end


	# test case user define
	test "should get about" do
		get :about
		assert_response :success
		#test the page title
		assert_select "title", "About | #{@base_title}"
	end
	
	# test case the contact page
	test "should get contact" do
		get :contact
		assert_response :success
		assert_select "title", "Contact | #{@base_title}"
	end
end
