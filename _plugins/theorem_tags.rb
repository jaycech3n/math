require 'slugify'

module Jekyll
  class TheoremTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @tag_name = tag_name
      @text = text
    end

    def desc(text)
      if @text.blank?
        ""
      else
        "<span class=\"desc\">#{@text}</span>"
      end
    end

    def render(context)
      "<span class=\"#{@tag_name}\" id=\"#{@text.slugify}\">"\
        "<span class=\"type\">#{@tag_name}</span>"\
        "#{desc(@text)}"\
      "</span>"
    end
  end
end

Liquid::Template.register_tag('theorem', Jekyll::TheoremTag)
Liquid::Template.register_tag('lemma', Jekyll::TheoremTag)
Liquid::Template.register_tag('proposition', Jekyll::TheoremTag)
Liquid::Template.register_tag('definition', Jekyll::TheoremTag)
Liquid::Template.register_tag('notation', Jekyll::TheoremTag)