require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:david)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
    users = JSON.parse(@response.body)

    assert_equal(Array, users['users'].class)
  end

  test "should get index with params" do
    get users_url({ search: { email: @user.email } }), as: :json
    assert_response :success
    users = JSON.parse(@response.body)
    assert_equal(@user.email, users['users'][0]['email'])
  end

  test "asdasd" do
    get users_url({ search: { email: "test@test.com"} }), as: :json
    assert_response :bad_request
    users = JSON.parse(@response.body)
    assert_equal("Este usuario no existe", users['error'])
  end

#   test "should get new" do
#     get new_user_url
#     assert_response :success
#   end

#   test "should create user" do
#     assert_difference('User.count') do
#       post users_url, params: { user: {  } }
#     end

#     assert_redirected_to user_url(User.last)
#   end

#   test "should show user" do
#     get user_url(@user)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_user_url(@user)
#     assert_response :success
#   end

#   test "should update user" do
#     patch user_url(@user), params: { user: {  } }
#     assert_redirected_to user_url(@user)
#   end

#   test "should destroy user" do
#     assert_difference('User.count', -1) do
#       delete user_url(@user)
#     end

#     assert_redirected_to users_url
#   end
end
