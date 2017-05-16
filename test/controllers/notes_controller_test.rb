require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @note = notes(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create note' do
    assert_difference('Note.count') do
      post :create, note: { nota_final: @note.nota_final, parcial1: @note.parcial1, parcial2: @note.parcial2, parcial3: @note.parcial3, parcial4: @note.parcial4, semestre1: @note.semestre1, semestre2: @note.semestre2, subject_id: @note.subject_id }
    end

    assert_redirected_to note_path(assigns(:note))
  end

  test 'should show note' do
    get :show, id: @note
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @note
    assert_response :success
  end

  test 'should update note' do
    patch :update, id: @note, note: { nota_final: @note.nota_final, parcial1: @note.parcial1, parcial2: @note.parcial2, parcial3: @note.parcial3, parcial4: @note.parcial4, semestre1: @note.semestre1, semestre2: @note.semestre2, subject_id: @note.subject_id }
    assert_redirected_to note_path(assigns(:note))
  end

  test 'should destroy note' do
    assert_difference('Note.count', -1) do
      delete :destroy, id: @note
    end

    assert_redirected_to notes_path
  end
end
