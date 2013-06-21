class HandInsController < ApplicationController
  unloadable

  respond_to :json, :html

  before_filter :get_project, :get_request

  helper :attachments
  include AttachmentsHelper

  def new
    @hand_in = HandIn.new
  end

  def create
    @hand_in = HandIn.new
    @hand_in.request = @request
    @hand_in.user = User.current
    @hand_in.save_attachments(params[:attachments])
    if @hand_in.save
      flash[:notice] = "Thanks for handing in the deliverable."
    end

    respond_with @hand_in, :location => project_request_path(@project, @request)
  end

  def show
    @hand_in = HandIn.find(params[:id])

  end

  def destroy
    @hand_in = HandIn.find(params[:id])

    @hand_in.destroy

    respond_with @hand_in, :location => project_request_path(@project, @request)
  end

  private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_request
    @request = Request.find(params[:request_id])
  end


end
