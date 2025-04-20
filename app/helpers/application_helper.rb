module ApplicationHelper
  def admin_namespace?
    request.fullpath.start_with?('/admin')
  end
end
