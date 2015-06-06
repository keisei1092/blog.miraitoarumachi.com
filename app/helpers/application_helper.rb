module ApplicationHelper
  def markdown(text)
    extensions = { autolink: true, disable_indented_code_blocks: true, tables: true, fenced_code_blocks: true, strikethrough: true, space_after_headers: true, superscript: true, underline: true, highlight: true, quote: true, footnote: true }

    unless @markdown
      renderer = Redcarpet::Render::HTML.new
      @markdown = Redcarpet::Markdown.new(renderer, extensions)
    end

    @markdown.render(text).html_safe
  end
end
