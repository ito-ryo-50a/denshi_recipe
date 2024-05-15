module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :notice then "bg-app-already"
    when :alert  then "bg-app-danger"
    when :error  then "bg-yellow-500"
    else "bg-gray-500"
    end
  end

  def page_title(page_title = "")
    base_title = "デンシレシピ"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
