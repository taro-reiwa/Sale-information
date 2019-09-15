module StoresHelper
  def current_store
    @current_store ||= Store.find_by(id: params[:format])
  end

  def store_in?
    !!current_store
  end
end
