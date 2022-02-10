module Jekyll
  module SectionTags

    class Helper
      class << self
        def numbering?
          Jekyll.const_defined?("Numbering")
        end

        def update_index(slug, numbering)
          unless slug.blank?
            if Jekyll::Numbering.index.has_key?(slug)
              raise "identifier `#{slug}` already in use"
            else
              Jekyll::Numbering.index=(Jekyll::Numbering.index.merge({slug => numbering}))
            end
          end
        end

        def generate_numbering_html(numbering)
          "<span class='numbering' id='#{numbering}'>#{numbering}</span>"
        end
      end
    end

    class SectionTag < Liquid::Tag
      def initialize(tag_name, title, tokens)
        super
        @title = title.strip
        @slug = Jekyll::Utils.slugify(@title, mode: 'pretty')
      end

      def render(context)
        if Helper::numbering? && Jekyll::Numbering.sec_numbers
          numbering = Jekyll::Numbering.use_section.join(".")
          Helper::update_index(@slug, numbering)
          numbering_html = Helper::generate_numbering_html(numbering)
        else
          numbering_html = ""
        end
        "<h2 class='section' id='#{@slug}'>#{numbering_html}#{@title}</h2>"
      end
    end

    class SubsectionTag < Liquid::Tag
      def initialize(tag_name, title, tokens)
        super
        @title = title.strip
        @slug = Jekyll::Utils.slugify(@title, mode: 'pretty')
      end

      def render(context)
        if Helper::numbering? && Jekyll::Numbering.sec_numbers
          numbering = Jekyll::Numbering.use_subsection.join(".")
          Helper::update_index(@slug, numbering)
          numbering_html = Helper::generate_numbering_html(numbering)
        else
          numbering_html = ""
        end
        "<h3 class='section' id='#{@slug}'>#{numbering_html}#{@title}</h3>"
      end
    end

    class SubsubsectionTag < Liquid::Tag
      def initialize(tag_name, title, tokens)
        super
        @title = title.strip
        @slug = Jekyll::Utils.slugify(@title, mode: 'pretty')
      end

      def render(context)
        if Helper::numbering? && Jekyll::Numbering.sec_numbers
          numbering = Jekyll::Numbering.use_subsubsection.join(".")
          Helper::update_index(@slug, numbering)
          numbering_html = Helper::generate_numbering_html(numbering)
        else
          numbering_html = ""
        end
        "<h4 class='section' id='#{@slug}'>#{numbering_html}#{@title}</h4>"
      end
    end

  end
end


Liquid::Template.register_tag('section', Jekyll::SectionTags::SectionTag)
Liquid::Template.register_tag('subsection', Jekyll::SectionTags::SubsectionTag)
Liquid::Template.register_tag('subsubsection', Jekyll::SectionTags::SubsubsectionTag)
