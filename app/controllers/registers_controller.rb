class RegistersController < ApplicationController
  before_action :set_register, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :admin_only

  def nuevoIng
    @register = Register.new(register_params)
    respond_to do |format|
      if @register.save
        format.json {render :json => "0".to_json, notice: "Matricula Creada"}
      else
        format.json {render :json => "0".to_json, notice: "Matricula Creada"}
      end
    end
  end
  def niewe
    @register = Register.new(register_params)
    respond_to do |format|
      if @register.save
        format.json {render :json => "0".to_json, notice: "Matricula Creada"}
      else
        format.json {render :json => "0".to_json, alert: "Error Algo salió mal"}
      end
    end
  end

  # GET /registers
  # GET /registers.json
  def index
    @register = Register.search(params[:search]).page(params[:page]).per(8).order('created_at DESC')
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
    @documentos = Document.all
    time = Document.first.number
    time.to_i.times {@register.documents.build}
    #obtener grupo
    @groups = Group.all
    @grupo = []
    @groups.each do |g|
      s = 0
      g.students.each do |st|
        s = s + 1
      end
      if g.students.all.count < g.max.to_i
        @grupo.push(g)
      end
    end
    #end obtener grupo
  end

  # GET /registers/1/edit
  def edit

  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)

    #@student.update_all(:group_id=>params[:grupo])

    #g = Group.where("id = ?",params[:grupo])
    #g.first.subjects.each do |sub|
    #  @student.first.subjects << sub
    #  note = Note.new(:student_id=> params[:student_id],:parcial1 => 0,:parcial2 => 0,:semestre1 => 0,:parcial3 => 0,:parcial4 => 0,:semestre2 => 0,:nota_final => 0,:subject_id=> sub.id)
    #  note.save
    #end


    respond_to do |format|
      if @register.save
        format.html { redirect_to new_student_path, notice: 'Nueva Matrícula Creada' }
        format.json { render :show, status: :created, location: @register }
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to @register, notice: 'Matrícula Modificada' }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to registers_url, notice: 'La Matrícula fue eliminada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:student_id, :year, :colegio_precedencia, :pago, :repitente, :extracurricular, documents_attributes: [:name,:description,:status,:register_id])
    end
end
