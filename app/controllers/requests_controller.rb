class RequestsController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  helper :attachments
  include AttachmentsHelper

  def show
    @request = Request.find(params[:id])
  end
 
  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id]) || Project.where('identifier = ?', params[:project_id]).first
  end
end
