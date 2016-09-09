module HomeHelper
  def cv_section(title, &content)
    render(layout: 'cv_section', locals: {title: title}) { capture(&content) }
  end
end
