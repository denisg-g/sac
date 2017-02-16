class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def teacher_only
    unless current_user.tipo=="Profesor"
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => 'No estás autorizado'
      else
        redirect_to root_path, :alert => 'No estás autorizado'
      end
    end
  end
  def tutor_only
    unless current_user.tipo=="Tutor"
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => 'No estás autorizado'
      else
        redirect_to root_path, :alert => 'No estás autorizado'
      end
    end
  end
  def student_tutor_only
    unless current_user.tipo=="Estudiante" || current_user.tipo=="Tutor"
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => 'No estás autorizado'
      else
        redirect_to root_path, :alert => 'No estás autorizado'
      end
    end
  end
  def student_only
    unless current_user.tipo=="Estudiante" 
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => 'No estás autorizado'
      else
        redirect_to root_path, :alert => 'No estás autorizado'
      end
    end
  end
  def admin_only
    unless current_user.tipo=="Admin"
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => 'No estás autorizado'
      else
        redirect_to root_path, :alert => 'No estás autorizado'
      end
    end
  end
  def admin_o_teacher_only
    unless current_user.tipo=="Profesor" || current_user.tipo =="Admin"
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => 'No estás autorizado'
      else
        redirect_to root_path, :alert => 'No estás autorizado'
      end
    end
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,        keys: [:tipo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:tipo])
    end

  def authenticated_user!
    authenticate_user! 
    if user_signed_in?
      super
    else
      redirect_to new_user_session_url, :notice => 'Debe iniciar sesion'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end
