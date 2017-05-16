class TutorsController < ApplicationController
  before_action :set_tutor, only: %i[search show edit update destroy]
  before_filter :authenticate_user!
  before_filter :admin_o_teacher_only
  # GET /tutors
  # GET /tutors.json
  def buscar_por_tutor
    @tutor = Tutor.select('id,first,second,apellido,apellido1').where('first LIKE ? or second LIKE ? or apellido LIKE ? or apellido1 LIKE ? ', "%#{params[:tutor]}%", "%#{params[:tutor]}%", "%#{params[:tutor]}%", "%#{params[:tutor]}%").order('created_at DESC')
    # Devuelve un json como salida al navegador.
    tutors = @tutor
    render json: tutors
  end

  def index
    @tutors = Tutor.search(params[:search]).page(params[:page]).per(8).order('created_at DESC')
  end

  # GET /tutors/1
  # GET /tutors/1.json
  def show; end

  # GET /tutors/new
  def new
    @tutor = Tutor.new
    2.times { @tutor.tel_tutors.build }
  end

  # GET /tutors/1/edit
  def edit
    @tutor.tel_tutors.build
  end

  # POST /tutors
  # POST /tutors.json
  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.students << Student.last #esto esta mal no ordena 
    respond_to do |format|
      if @tutor.save
        @user = User.new(email: tutor_params[:email], tipo: 'Tutor', tipo_id: @tutor.id, password: tutor_params[:cedula], password_confirmation: tutor_params[:cedula])
        if @user.save
          format.html { redirect_to root_path, notice: 'Matricula Creada con éxito!' }
          format.json { render :show, status: :created, location: @tutor }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      else
        format.html { render :new }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutors/1
  # PATCH/PUT /tutors/1.json
  def update
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to @tutor, notice: 'El tutor ha sido actualizado' }
        format.json { render :show, status: :ok, location: @tutor }
      else
        format.html { render :edit }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors/1
  # DELETE /tutors/1.json
  def destroy
    @us = User.find_by(tipo_id: @tutor.id)
    @us.destroy
    @tutor.destroy
    respond_to do |format|
      format.html { redirect_to tutors_url, notice: 'El tutor se ha eliminado' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tutor_params
    params.require(:tutor).permit(:tipo_id, :cedula, :first, :second, :apellido, :apellido1, :tipotutor, :email, :direction, tel_tutors_attributes: %i[id tipo numero _destroy])
  end
end
