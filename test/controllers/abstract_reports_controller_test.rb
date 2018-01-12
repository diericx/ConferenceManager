require 'test_helper'

class AbstractReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abstract_report = abstract_reports(:one)
  end

  test "should get index" do
    get abstract_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_abstract_report_url
    assert_response :success
  end

  test "should create abstract_report" do
    assert_difference('AbstractReport.count') do
      post abstract_reports_url, params: { abstract_report: { abstractId: @abstract_report.abstractId, breadth: @abstract_report.breadth, innovation: @abstract_report.innovation, notes: @abstract_report.notes, presentationQuality: @abstract_report.presentationQuality, publicContent: @abstract_report.publicContent, recommendation: @abstract_report.recommendation } }
    end

    assert_redirected_to abstract_report_url(AbstractReport.last)
  end

  test "should show abstract_report" do
    get abstract_report_url(@abstract_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_abstract_report_url(@abstract_report)
    assert_response :success
  end

  test "should update abstract_report" do
    patch abstract_report_url(@abstract_report), params: { abstract_report: { abstractId: @abstract_report.abstractId, breadth: @abstract_report.breadth, innovation: @abstract_report.innovation, notes: @abstract_report.notes, presentationQuality: @abstract_report.presentationQuality, publicContent: @abstract_report.publicContent, recommendation: @abstract_report.recommendation } }
    assert_redirected_to abstract_report_url(@abstract_report)
  end

  test "should destroy abstract_report" do
    assert_difference('AbstractReport.count', -1) do
      delete abstract_report_url(@abstract_report)
    end

    assert_redirected_to abstract_reports_url
  end
end
