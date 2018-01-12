require 'test_helper'

class AbstractProposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abstract_proposal = abstract_proposals(:one)
  end

  test "should get index" do
    get abstract_proposals_url
    assert_response :success
  end

  test "should get new" do
    get new_abstract_proposal_url
    assert_response :success
  end

  test "should create abstract_proposal" do
    assert_difference('AbstractProposal.count') do
      post abstract_proposals_url, params: { abstract_proposal: { title: @abstract_proposal.title, url: @abstract_proposal.url } }
    end

    assert_redirected_to abstract_proposal_url(AbstractProposal.last)
  end

  test "should show abstract_proposal" do
    get abstract_proposal_url(@abstract_proposal)
    assert_response :success
  end

  test "should get edit" do
    get edit_abstract_proposal_url(@abstract_proposal)
    assert_response :success
  end

  test "should update abstract_proposal" do
    patch abstract_proposal_url(@abstract_proposal), params: { abstract_proposal: { title: @abstract_proposal.title, url: @abstract_proposal.url } }
    assert_redirected_to abstract_proposal_url(@abstract_proposal)
  end

  test "should destroy abstract_proposal" do
    assert_difference('AbstractProposal.count', -1) do
      delete abstract_proposal_url(@abstract_proposal)
    end

    assert_redirected_to abstract_proposals_url
  end
end
