module Jekyll
  class RefTag < Liquid::Tag

    def initialize(tag_name, ref, tokens)
      super
      @ref = Jekyll::Utils.slugify(ref.strip, mode: 'pretty')
      @numbering = Jekyll.const_defined?("Numbering")
    end

    def render(context)
      text =
        if @numbering
          n = Jekyll::Numbering.index.fetch(@ref, nil)
          n ? n : @ref
        else
          @ref
        end
      "<a href='\##{@ref}' class='ref'>#{text}</a>"
    end
  end
end

Liquid::Template.register_tag('ref', Jekyll::RefTag)
