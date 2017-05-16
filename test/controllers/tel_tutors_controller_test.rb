require 'test_helper'

class TelTutorsControllerTest < ActionController::TestCase
  setup do
    @tel_tutor = tel_tutors(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:tel_tutors)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create tel_tutor' do
    assert_difference('TelTutor.count') do
      post :create, tel_tutor: { numero: @tel_tutor.numero, tipo: @tel_tutor.tipo, tutor_id: @tel_tutor.tutor_id }
    end

    assert_redirected_to tel_tutor_path(assigns(:tel_tutor))
  end

  test 'should show tel_tutor' do
    get :show, id: @tel_tutor
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @tel_tutor
    assert_response :success
  end

  test 'should update tel_tutor' do
    patch :update, id: @tel_tutor, tel_tutor: { numero: @tel_tutor.numero, tipo: @tel_tutor.tipo, tutor_id: @tel_tutor.tutor_id }
    assert_redirected_to tel_tutor_path(assigns(:tel_tutor))
  end

  test 'should destroy tel_tutor' do
    assert_difference('TelTutor.count', -1) do
      delete :destroy, id: @tel_tutor
    end

    assert_redirected_to tel_tutors_path
  end
end
