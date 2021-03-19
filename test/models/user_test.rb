require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'should not save user without email' do
    user = User.new
    # false == false
    assert_not user.save
  end

  test 'user email should be uniqueness' do
    user = User.new(email: users(:pepe).email)
    assert_not user.save
  end

  test 'user email should be a valid email' do
    user = User.new(email: 'user@usercom')
    assert_not user.save
  end

  test 'user must delete all their children' do
    assert users(:david).vehicles.present? || users(:david).appointments.present?

    assert_nothing_raised do
      users(:david).destroy
    end
  end
end
