module ApplicationHelper
	def markdown(body)
  		@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
  		@markdown.render(body)
	end

	def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
