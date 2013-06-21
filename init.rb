Redmine::Plugin.register :deliverables do
  name 'Deliverables plugin'
  author 'Achilleas Buisman'
  description 'A Redmine plugin for managing deliverables.'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://www.abuisman.nl'

  # Permissions

  # In projects
  project_module :deliverables do
    permission :view_deliverables, :deliverables => [:index, :show]
    permission :view_requests, :requests => [:index, :show]
    permission :manage_hand_ins_for_deliverable, :hand_ins => [:create, :new, :update, :edit, :destroy]
  end
  
  # Menu items
  menu :project_menu, :deliverables_requests, { :controller => 'deliverables', :action => 'index' }, :caption => 'Deliverables', :after => :activity, :param => :project_id
  
  menu :admin_menu, :deliverables, { :controller => 'admin_deliverables', :action => 'index' }, :caption => 'Deliverables', :after => :projects, :param => :project_id

end
