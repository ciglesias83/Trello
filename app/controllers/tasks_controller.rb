class TasksController < ApplicationController

  before_action :task_noended, only: [:index]
  before_action :task_ended, only: [:index]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :get_members, only: [:new, :create, :edit, :update]
  before_action :authenticate_member!, only: [:new, :create, :edit, :update, :destroy]
  
   

   

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(checklist: false).order("end_date asc")
    @tasks1 = Task.where(checklist: true).order("end_date asc")
   
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @members = Member.all.map { |member| [member.name, member.id] }
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.member_id = current_member.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
    
    def get_members
      @members = Member.all.map { |member| [member.name, member.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :duration, :start_date, :end_date, :member_id, :checklist)
    end
    
    def task_noended
      @task = Task.where(checklist: false)
    end
    
    def task_ended
      @task1 = Task.where(checklist: true)
    end

end
