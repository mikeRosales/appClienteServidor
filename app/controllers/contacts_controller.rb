class ContactsController < ApplicationController
   before_action :set_contact, only: [:show, :edit, :update, :destroy]
   protect_from_forgery with: :null_session
before_action :auth_user!
  # GET /contacts
  # GET /contacts.json
  def auth_user!
      if admin_signed_in?
        authenticate_admin!
      else
        authenticate_user!
      end
  end
  def index
    if admin_signed_in?
      @contacts = Contact.all
    else
     @contacts = current_user.contacts
    end
  end

  def search
  @contact = Contact.find_by_contact_name params[:search_name]
   render action: 'show'

  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show

  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
     @contactoE = User.find_by('email = ?', @contact.contact_name)

     if @contactoE.blank?
          flash[:alert] = "El usuario no existe"
          render :action => :new

    else
       @contact.user_id = current_user.id

        respond_to do |format|
          if @contact.save
              @usercontact = Usercontact.new(usercontacts_params)
              @usercontact.save
           @userproject = Userproject.new(userprojects_params)
              @userproject.save
           format.html {  redirect_to @contact, notice: 'Contacto agregado correctamente.' }

             format.json { render :show, status: :created, location: @contact }
        else
          format.html { render :new }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
       end

    end



end
 def userprojects_params
    params[:user_id] =User.find_by('email = ?', @contact.contact_name).id
   params[:project_id] = @contact.project_id
    params.permit(:user_id, :project_id)
  end
  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
  def usercontacts_params
    params[:user_id] = current_user.id
   params[:contact_id] = @contact.id
    params.permit(:user_id, :contact_id)
  end
  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:contact_name,:project_id)
    end
end
