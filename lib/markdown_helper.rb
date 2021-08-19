module MarkdownHelper

  require 'middleman-core/renderers/redcarpet'

  class TeachFeMarkdownRenderer < Middleman::Renderers::MiddlemanRedcarpetHTML
    def initialize(options = {})
      super options.merge(
        :with_toc_data => true,
        :fenced_code_blocks => true,
        :smartypants => true,
        :tables => true,
        :highlight => true,
        :superscript => true,
      )
    end

    def header(text, level)
      case level
      when 1
        %(<h1 class="govuk-heading-xl">#{text.strip}</h1>)
      when 2
        %(<h1 class="govuk-heading-l">#{text.strip}</h2>)
      when 3
        %(<h3 class="govuk-heading-m">#{text.strip}</h3>)
      when 4
        %(<h4 class="govuk-heading-s">#{text.strip}</h4>)
      when 5
        %(<h5 class="govuk-heading-s">#{text.strip}</h5>)
      else
        %(<h4>#{text.strip}</h4>)
      end
    end

    def paragraph(text)
      %(<p class="govuk-body">#{text.strip}</p>)
    end

    def list(contents, list_type)
      case list_type
      when :ordered
        %(<ol class="govuk-list govuk-list--number">#{contents}</ol>)
      when :unordered
        %(<ul class="govuk-list govuk-list--bullet">#{contents}</ul>)
      end
    end

    def table(header, body)
      %(<table class="govuk-table"><thead>#{header}<thead><tbody>#{body}</tbody></table>)
    end

    def table_row(content)
      %(<tr class="govuk-table__row">#{content}</tr>)
    end

    def table_cell(content, header)
      if header
        %(<th class="govuk-table__cell">#{content}</td>)
      else
        %(<td class="govuk-table__cell">#{content}</td>)
      end
    end

    def link(link, title, content)
      if not URI(link).relative?
        %(<a href="#{link}" onclick="window.site.analytics.raiseExitPointEvent('#{link}')" class="govuk-link">#{content}</a>)
      else
        %(<a href="#{link}" class="govuk-link">#{content}</a>)
      end

    end

  end
end