class DocumentsController < ApplicationController
  before_action :set_documents, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :admin_only

  def new
    #@max = Document.find(1)
    #@max = @max.number.to_i
    #@docu = Document.all
    $document = Document.new 
    $register = Register.new
    $tutor = Tutor.new
    $student = Student.new
  end

  def create
    @document = Document.new(document_params)
    respond_to do |format|
      if @document.save
        format.html { redirect_to new_tutor_path, notice:'Correcto' }
        format.json { render :show, status: :created,location: @document }
      else 
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'El Documento ha sido actualizado' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to tutors_url, notice: 'El documento se ha eliminado' }
      format.json { head :no_content }
    end
  end

  private 
    def set_documents
      @document = Document.find(params[:id])
    end
    def document_params
      params.require(:document).permit(:name,:status, :number,:description, :register_id)
    end
end