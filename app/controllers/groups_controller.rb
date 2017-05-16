class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_filter :authenticate_user!
  before_filter :admin_o_teacher_only
  # GET /groups
  # GET /groups.json
  def index
    # @groups= Group.all
    if current_user.tipo == 'Profesor'
      @groups = Group.where('teacher_id = ?', Teacher.find(current_user.tipo_id)).search(params[:search]).page(params[:page]).per(2).order('created_at DESC')
    elsif current_user.tipo == 'Admin'
      @groups = Group.search(params[:search]).page(params[:page]).per(2).order('created_at DESC')
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show; end

  # GET /groups/new
  def new
    if current_user.tipo == 'Profesor'
      redirect_to root_path, alert: 'No estás autorizado'
    end
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    if current_user.tipo == 'Profesor'
      redirect_to root_path, alert: 'No estás autorizado'
    end
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.teacher_id = current_user.tipo.to_i
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Grupo Creado' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Grupo Actualizado ' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'El grupo fue eliminado' }
      format.json { head :no_content }
    end
  end

  def edit_notes; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).permit(:name, :seccion, :max, :turno, :tipo)
  end
end
