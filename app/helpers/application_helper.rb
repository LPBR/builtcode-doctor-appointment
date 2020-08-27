module ApplicationHelper
  def item_menu_active_class(*paths)
    'active' if request.original_fullpath.in? paths
  end
end
