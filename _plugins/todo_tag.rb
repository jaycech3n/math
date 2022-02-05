module Jekyll
  class TodoTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<span class=\"todo tag\" data-text=\"#{@text}\" tabindex=0>TODO</span>" # style .tag in any available css
    end
  end
end

Liquid::Template.register_tag('TODO', Jekyll::TodoTag)
