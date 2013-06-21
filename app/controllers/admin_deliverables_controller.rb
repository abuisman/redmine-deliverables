class AdminDeliverablesController < ApplicationController

  unloadable
  layout 'admin'

  respond_to :json, :html

  before_filter :require_admin, :get_projects

  helper :attachments
  include AttachmentsHelper
  helper :custom_fields
  include CustomFieldsHelper

  def index
    @deliverables = Deliverable.active
    @archived_deliverables = Deliverable.archived
  end
 
  def new
    @deliverable = Deliverable.new
  end

  def create
    @deliverable = Deliverable.new   
    @deliverable.attributes = params[:deliverable]
    @deliverable.user = User.current
    
    if params[:projects]
      params[:projects].each do |pro|
        @deliverable.requests << Request.create({:project => Project.find(pro)})
      end
    end

    @deliverable.save
    respond_with @deliverable 
  end

  def show
    @deliverable = Deliverable.find(params[:id])
  end

  def edit
    @deliverable = Deliverable.find(params[:id])
  end

  def update
    @deliverable = Deliverable.find(params[:id])
    @deliverable.attributes = params[:deliverables]

    params[:projects].each do |pro|
      @deliverable.requests << Request.create({:project => Project.find(pro)})
    end

    @deliverable.save
    respond_with @deliverable
  end

  def archive
    @deliverable = Deliverable.find(params[:deliverable_id])

    if @deliverable.archived == false
      @deliverable.archive
    end

    flash[:notice] = "Deliverable #{@deliverable.name} has been archived."
    redirect_to deliverable_path(@deliverable)
  end

  def activate
    @deliverable = Deliverable.find(params[:deliverable_id])

    if @deliverable.archived == true
      @deliverable.activate
    end

    flash[:notice] = "Deliverable #{@deliverable.name} has been activated."
    redirect_to deliverable_path(@deliverable)
  end

  def destroy
    Deliverable.transaction do
      @deliverable = Deliverable.find(params[:id])

      @deliverable.requests.each do |req|
        req.hand_ins.delete_all
        req.destroy
      end

      @deliverable.destroy
    end

    redirect_to deliverables_path
  end

  private

  def get_projects
    @projects = Project.all
  end

end
