require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

    def setup
      @unactivated_user = users(:lana)
      @activated_user   = users(:archer)
    end

    test "should only show activated users" do
      log_in_as (@activated_user)
      get user_path(@unactivated_user)
      assert_redirected_to root_url
    end

end
