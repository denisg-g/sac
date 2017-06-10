class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy actu]
  before_filter :authenticate_user!
  # before_filter :admin_only
  # GET /students
  # GET /students.json
  def buscar_por_student
    @student = Student.select('id,nombre,nombre1,apellido,apellido1,email,direction,tel').where('nombre LIKE ? or nombre1 LIKE ? or apellido LIKE ? or apellido1 LIKE ? ', "%#{params[:student]}%", "%#{params[:student]}%", "%#{params[:student]}%", "%#{params[:student]}%").order('created_at DESC')
    # Devuelve un json como salida al navegador.
    student = @student
    render json: student
  end

  def actu
    respond_to do |format|
      if @student.update(student_params)
        format.json { render json: '0'.to_json }
      else
        format.json { render json: '0'.to_json }
      end
    end
  end

  def index


    @students = Student.search(params[:search]).page(params[:page]).per(8).order('created_at DESC')


    respond_to do |format|
      format.html
      format.pdf { render template: 'students/Reporte_students', pdf: 'Reporte_students' }
      format.xls

  end

  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @group = @student.group
    @cont = 0
    if @group.present?
      @group.students.each do |_s|
        @cont += 1
      end
    end
  end

  # GET /students/new
  def new
    @student = Student.new
    @tutors = Tutor.all.order('created_at desc')
    if Student.order('created_at DESC').present?
      @car = Student.order(:id).last
      @carnet = @car.carnet.to_i + 1
    else
      @carnet = 1000
    end
    @groups = Group.all
    @grupo = []
    @groups.each do |g|
      s = 0
      g.students.each do |_st|
        s += 1
      end
      @grupo.push(g) if g.students.all.count < g.max.to_i
    end
  end

  # GET /students/1/edit
  def edit
    # if current_user.tipo_id == params[:id]
    # else
    # redirect_to root_path, alert: "No tenes acceso"
    # end
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        @user = User.new(email: student_params[:email], tipo: 'Estudiante', tipo_id: @student.id, password: student_params[:carnet], password_confirmation: student_params[:carnet])
        if @user.save
          format.html { redirect_to new_tutor_path(id_student: @student.id), notice: 'Nuevo estudiante creado' }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to root_path, notice: 'El estudiante se actualizó.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @us = User.find_by(tipo_id: @student.id)
    @us.destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'El estuadiante fue eliminado' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:group_id, :carnet, :nombre, :nombre1, :apellido, :apellido1, :email, :tel, :direction, :tipo_id, :tipo, :estado, :lugar_nac, :fecha_nac, :tipo_sangre, :avatar, tutor_ids: [], groups_atributes: [:group_id])
  end
end
