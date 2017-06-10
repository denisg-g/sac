class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show edit update destroy]

  before_filter :admin_only

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.search(params[:search]).page(params[:page]).per(8).order('created_at DESC')
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show; end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    @teacher.tel_teachers.build 
  end

  # GET /teachers/1/edit
  def edit; end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        @user = User.new(email: teacher_params[:email], tipo: 'Profesor', tipo_id: @teacher.id, password: teacher_params[:cedula], password_confirmation: teacher_params[:cedula])
        if @user.save
          format.html { redirect_to @teacher, notice: 'El docente se creó' }
          format.json { render :show, status: :created, location: @teacher }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'El docente fue actualizado' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @us = User.find_by(tipo_id: @teacher.id)
    @us.try(:destroy)
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'El docente se ha eliminado' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:name, :name1, :image, :lastname, :lastname1, :email, :direction, :fecha_nac, :tipo_id, :cedula, tel_teachers_attributes: %i[id tipo numero _destroy])
  end
end
