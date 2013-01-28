module ApplicationHelper

  def logged_in?
    not request.authorization.nil?
  end

  def credited_image_tag (source, options={})
    content_tag(:figure, class: options[:class]) do
      image_tag(source, class: options[:class]) +
      content_tag(:figcaption) do
        render 'credit/' + options[:credit]
      end
    end
  end

end
