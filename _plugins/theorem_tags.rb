require 'slugify'

module Jekyll
  module TheoremTags

    class Helper
      class << self
        def numbering?
          Jekyll.const_defined?("Numbering")
        end

        def update_index(slug)
          numbering = Jekyll::Numbering.use_counter.join(".")
          unless slug.blank?
            if Jekyll::Numbering.index.has_key?(slug)
              raise "identifier `#{slug}` already in use"
            else
              Jekyll::Numbering.index=(Jekyll::Numbering.index.merge({slug => numbering}))
            end
          end
          numbering
        end

        def generate_numbering_html(numbering)
          "<span class='numbering' id='#{numbering}'>#{numbering}</span>"
        end

        def render(type, desc, slug, numbering_html)
          unless desc.blank?
            desc_html = "<span class='desc'>#{desc}</span>"
          else
            desc_html = ""
          end

          "<span class='#{type}' id='#{slug}'>"\
            "<span class='type'>#{type}</span>"\
            "#{numbering_html}#{desc_html}"\
          "</span>"
        end
      end
    end

    class TheoremTag < Liquid::Tag
      def initialize(type, desc, tokens)
        super
        @type = type
        @desc = desc.strip
        @slug = @desc.slugify
      end

      def render(context)
        if Helper::numbering? && Jekyll::Numbering.thm_numbers
          numbering = Helper::update_index(@slug)
          numbering_html = Helper::generate_numbering_html(numbering)
        else
          numbering_html = ""
        end
        Helper::render(@type, @desc, @slug, numbering_html)
      end
    end

    # In contrast to theorem tags, equation tag counters are always available
    class EquationTag < Liquid::Tag
      def initialize(type, desc, tokens)
        super
        @type = type
        @desc = desc.strip
        @slug = @desc.slugify
      end

      def render(context)
        if Helper::numbering?
          numbering = Helper::update_index(@slug)
          numbering_html = Helper::generate_numbering_html(numbering)
        else
          numbering_html = ""
        end
        Helper::render(@type, @desc, @slug, numbering_html)
      end
    end

  end
end


Liquid::Template.register_tag('theorem', Jekyll::TheoremTags::TheoremTag)
Liquid::Template.register_tag('lemma', Jekyll::TheoremTags::TheoremTag)
Liquid::Template.register_tag('proposition', Jekyll::TheoremTags::TheoremTag)
Liquid::Template.register_tag('definition', Jekyll::TheoremTags::TheoremTag)
Liquid::Template.register_tag('notation', Jekyll::TheoremTags::TheoremTag)
Liquid::Template.register_tag('remark', Jekyll::TheoremTags::TheoremTag)

Liquid::Template.register_tag('equation', Jekyll::TheoremTags::EquationTag)
