class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :teacher_only 
  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all.order('created_at ASC')
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
    @val = Note.where("id=?",params[:note])
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @val = Note.where("id=?",evaluation_params[:note_id])
    
    #sub = @val.first.subject
    #@student = Student.find(params[:student])
    #sub.students << @student
    

    if (evaluation_params[:from] == "parcial1")
      @val = @val.first.parcial1
      sum = @val + evaluation_params[:value].to_d
      Note.where("id = ?",evaluation_params[:note_id]).update_all(:parcial1=>sum)
    end
    if (evaluation_params[:from] == "parcial2")
      @val = @val.first.parcial2
      sum = @val + evaluation_params[:value].to_d
      Note.where("id = ?",evaluation_params[:note_id]).update_all(:parcial2=>sum)
    end
    
    if (evaluation_params[:from] == "parcial3")
      @val = @val.first.parcial3
      sum = @val + evaluation_params[:value].to_d
      Note.where("id = ?",evaluation_params[:note_id]).update_all(:parcial3=>sum)
    end
    if (evaluation_params[:from] == "parcial4")
      @val = @val.first.parcial4
      sum = @val + evaluation_params[:value].to_d
      Note.where("id = ?",evaluation_params[:note_id]).update_all(:parcial4=>sum)
    end

      sump =  @val.parcial1 + @val.parcial2
      avg = sump / 2
      Note.where("id = ?",evaluation_params[:note_id]).update_all(:semestre1=>avg)
    

      sump = @val.parcial3 + @val.parcial4
      avg = sump / 2
      Note.where("id = ?",evaluation_params[:note_id]).update_all(:semestre2=>avg)
    
      sump =  @val.semestre1 + @val.semestre2
      avg = sump / 2
      Note.where("id = ?",evaluation_params[:note_id]).update_all(:nota_final=>avg)



    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to group_url(params[:student]), notice: 'Evaluación creada' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluación Modificada' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluación eliminada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:name, :value, :from,:total, :note_id)
    end
end
