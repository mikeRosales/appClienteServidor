class ProjectsController < ApplicationController
before_action :auth_user!

  before_action :set_project, only: [:show, :edit, :update, :destroy]

 def auth_user!
      if admin_signed_in?
        authenticate_admin!
      else
        authenticate_user!
      end
  end
  # GET /projects
  # GET /projects.json
  def index

     if admin_signed_in?
      @projects = Project.all
    else
     @projects =  Project.joins(:userprojects)

    end

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end
   def search
  @project = Project.find_by_project_name params[:search_name]
   render action: 'show'

  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id


    respond_to do |format|
      if @project.save
          @userproject = Userproject.new(userprojects_params)
              @userproject.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
 def userprojects_params
    params[:user_id] = current_user.id
   params[:project_id] = @project.id
    params.permit(:user_id, :project_id)
  end
  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_name, :company, :dateStart, :dateEnd, :description)
    end
end
