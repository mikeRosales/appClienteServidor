class UserscontactsController < ApplicationController
	  before_action :set_contact, only: [:show, :edit, :update, :destroy]
   protect_from_forgery with: :null_session

  # GET /contacts
  # GET /contacts.json
  def index

  end



  # GET /contacts/1
  # GET /contacts/1.json
  def show

  end

  # GET /contacts/new
  def new

  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create



    respond_to do |format|
      if @usercontact.save
        format.html { redirect_to redirect_to :controller => :contacts, :action => :show,  :contact_id => @contact.id}
        format.json { render :show, status: :created, location: @usercontact }
      else
        format.html { redirect_to redirect_to :controller => :contacts, :action => :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
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
        format.json { render json: @usercontact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to user_contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_contacts
      @usercontact = Usercontact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_contacts_params
      params.require(:contact).permit(:id)
    end
end


