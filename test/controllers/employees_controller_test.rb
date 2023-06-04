require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get api_v1_employees_url, as: :json
    assert_response :success
  end

  test "should create employee" do
    assert_difference("Employee.count") do
      post api_v1_employees_url, params: { employee: { name: @employee.name } }, as: :json
    end

    assert_response :created
  end

  test "should show employee" do
    get api_v1_employees_url(@employee), as: :json
    assert_response :success
  end

  test "should update employee" do
    patch api_v1_employees_url(@employee), params: { employee: { name: @employee.name } }, as: :json
    assert_response :success
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete api_v1_employees_url(@employee), as: :json
    end

    assert_response :no_content
  end
end
