require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { apellido1: @student.apellido1, apellido: @student.apellido, carnet: @student.carnet, direction: @student.direction, email: @student.email, estado: @student.estado, nombre1: @student.nombre1, nombre: @student.nombre }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { apellido1: @student.apellido1, apellido: @student.apellido, carnet: @student.carnet, direction: @student.direction, email: @student.email, estado: @student.estado, nombre1: @student.nombre1, nombre: @student.nombre }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
