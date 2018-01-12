require 'test_helper'

class AbstractReviewerAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abstract_reviewer_assignment = abstract_reviewer_assignments(:one)
  end

  test "should get index" do
    get abstract_reviewer_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_abstract_reviewer_assignment_url
    assert_response :success
  end

  test "should create abstract_reviewer_assignment" do
    assert_difference('AbstractReviewerAssignment.count') do
      post abstract_reviewer_assignments_url, params: { abstract_reviewer_assignment: { abstract_id: @abstract_reviewer_assignment.abstract_id, user_id: @abstract_reviewer_assignment.user_id } }
    end

    assert_redirected_to abstract_reviewer_assignment_url(AbstractReviewerAssignment.last)
  end

  test "should show abstract_reviewer_assignment" do
    get abstract_reviewer_assignment_url(@abstract_reviewer_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_abstract_reviewer_assignment_url(@abstract_reviewer_assignment)
    assert_response :success
  end

  test "should update abstract_reviewer_assignment" do
    patch abstract_reviewer_assignment_url(@abstract_reviewer_assignment), params: { abstract_reviewer_assignment: { abstract_id: @abstract_reviewer_assignment.abstract_id, user_id: @abstract_reviewer_assignment.user_id } }
    assert_redirected_to abstract_reviewer_assignment_url(@abstract_reviewer_assignment)
  end

  test "should destroy abstract_reviewer_assignment" do
    assert_difference('AbstractReviewerAssignment.count', -1) do
      delete abstract_reviewer_assignment_url(@abstract_reviewer_assignment)
    end

    assert_redirected_to abstract_reviewer_assignments_url
  end
end
