module Jekyll
  class TodoTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "<span class=\"tag\"><strong>TODO</strong>#{@text}</span>" # style .tag in any available css
    end
  end
end

Liquid::Template.register_tag('TODO', Jekyll::TodoTag)
