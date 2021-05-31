module MarkdownHelper

  require 'middleman-core/renderers/redcarpet'

  class TeachFeMarkdownRenderer < Middleman::Renderers::MiddlemanRedcarpetHTML
    def initialize(options = {})
      super options.merge(
        :with_toc_data => true,
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
      else
        %(<h4>#{text.strip}</h4>)
      end
    end

    def paragraph(text)
      %(<p class="govuk-body">#{text.strip}</p>)
    end
  end
end