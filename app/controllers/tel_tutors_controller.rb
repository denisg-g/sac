class TelTutorsController < ApplicationController
  before_action :set_tel_tutor, only: %i[show edit update destroy]
  before_filter :authenticate_user!
  # GET /tel_tutors
  # GET /tel_tutors.json
  def index
    @tel_tutors = TelTutor.all
  end

  # GET /tel_tutors/1
  # GET /tel_tutors/1.json
  def show; end

  # GET /tel_tutors/new
  def new
    @tel_tutor = TelTutor.new
  end

  # GET /tel_tutors/1/edit
  def edit; end

  # POST /tel_tutors
  # POST /tel_tutors.json
  def create
    @tel_tutor = TelTutor.new(tel_tutor_params)

    respond_to do |format|
      if @tel_tutor.save
        format.html { redirect_to @tel_tutor, notice: 'Tel tutor was successfully created.' }
        format.json { render :show, status: :created, location: @tel_tutor }
      else
        format.html { render :new }
        format.json { render json: @tel_tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tel_tutors/1
  # PATCH/PUT /tel_tutors/1.json
  def update
    respond_to do |format|
      if @tel_tutor.update(tel_tutor_params)
        format.html { redirect_to @tel_tutor, notice: 'Tel tutor was successfully updated.' }
        format.json { render :show, status: :ok, location: @tel_tutor }
      else
        format.html { render :edit }
        format.json { render json: @tel_tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tel_tutors/1
  # DELETE /tel_tutors/1.json
  def destroy
    @tel_tutor.destroy
    respond_to do |format|
      format.html { redirect_to tel_tutors_url, notice: 'Tel tutor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tel_tutor
    @tel_tutor = TelTutor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tel_tutor_params
    params.require(:tel_tutor).permit(:tipo, :numero, :tutor_id)
  end
end
