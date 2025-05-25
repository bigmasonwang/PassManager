module ApplicationHelper
  def logo(class_name: "navbar-brand")
    link_to(root_path, class: "#{class_name}") do
      content_tag(:span, class: "bi bi-lock-fill") do
        "PassManager"
      end
    end
  end
end
