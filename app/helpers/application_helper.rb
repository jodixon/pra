module ApplicationHelper
	def markdown(body)
  		@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
  		@markdown.render(body)
	end
end
