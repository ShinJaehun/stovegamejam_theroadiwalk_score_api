require "test_helper"

class UserScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_score = user_scores(:one)
  end

  test "should get index" do
    get user_scores_url, as: :json
    assert_response :success
  end

  test "should create user_score" do
    assert_difference('UserScore.count') do
      post user_scores_url, params: { user_score: { name: @user_score.name, score: @user_score.score } }, as: :json
    end

    assert_response 201
  end

  test "should show user_score" do
    get user_score_url(@user_score), as: :json
    assert_response :success
  end

  test "should update user_score" do
    patch user_score_url(@user_score), params: { user_score: { name: @user_score.name, score: @user_score.score } }, as: :json
    assert_response 200
  end

  test "should destroy user_score" do
    assert_difference('UserScore.count', -1) do
      delete user_score_url(@user_score), as: :json
    end

    assert_response 204
  end
end
