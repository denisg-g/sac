class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  before_filter :authenticate_user! 
  before_filter :tutor_only, only:[:index]
  before_filter :student_only, only:[:index]
  
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all.order('created_at ASC')
    if current_user.tipo == "Estudiante"
      stud = Student.where("id = ?",current_user.tipo_id)
      @groups = Group.where("id=?",stud.first.group_id)
    else
      tut = Tutor.where("id=?",current_user.tipo_id)
      stud = tut.first.students
      @groups = Group.where("id=?",stud.first.group_id)
    end
    
    #respond_to do |format|
     # format.html
      #format.json
      #format.pdf { render template: 'notes/reportes', pdf: 'Reporte'}
    #end
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:parcial1, :parcial2, :semestre1, :parcial3, :parcial4, :semestre2, :nota_final, :subject_id,:student_id)
    end
end
