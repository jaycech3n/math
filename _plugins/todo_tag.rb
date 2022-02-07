module Jekyll
  class TodoTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      # style .todo in any available css
      "<span class='todo tag'"\
      "#{" data-text='—#{@text}'" unless @text.blank?}"\
      " tabindex=0><span>todo</span></span>"
    end
  end
end

Liquid::Template.register_tag('todo', Jekyll::TodoTag)
Liquid::Template.register_tag('TODO', Jekyll::TodoTag)
