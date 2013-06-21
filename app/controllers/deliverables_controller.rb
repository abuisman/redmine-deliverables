class DeliverablesController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  def index
    @requests = Request.joins(:deliverable).where('project_id = ? and deliverables.archived = ?', @project.id, false).order('deliverables.deadline ASC')
  end
 
  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id]) || Project.where('identifier = ?', params[:project_id]).first
  end
end
