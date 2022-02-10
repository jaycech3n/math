module Jekyll
  module TheoremsEquations

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

        def render_block(type, desc, slug, numbering_html, body)
          "<div class='#{type} block' id='#{slug}' markdown=1>"\
            "<span class='block-header'><span class='type'>#{type}</span>"\
            "#{numbering_html}#{"<span class='desc'>#{desc}</span>" unless desc.blank?}</span>" +
            body +
          "</div>"
        end

        def render(type, desc, slug, numbering_html)
          "<span class='#{type}' id='#{slug}'>"\
            "<span class='type'>#{type}</span>"\
            "#{numbering_html}#{"<span class='desc'>#{desc}</span>" unless desc.blank?}"\
          "</span>"
        end
      end
    end

    class TheoremBlock < Liquid::Block
      def initialize(type, desc, tokens)
        super
        @type = type
        @desc = desc.strip
        @slug = Jekyll::Utils.slugify(@desc, mode: 'pretty')
      end

      def render(context)
        if Helper::numbering? && Jekyll::Numbering.thm_numbers
          numbering = Helper::update_index(@slug)
          numbering_html = Helper::generate_numbering_html(numbering)
        else
          numbering_html = ""
        end
        Helper::render_block(@type, @desc, @slug, numbering_html, super)
      end
    end

    # In contrast to theorem blocks, equation tag counters are always available
    class EquationTag < Liquid::Tag
      def initialize(type, desc, tokens)
        super
        @type = type
        @desc = desc.strip
        @slug = Jekyll::Utils.slugify(@desc, mode: 'pretty')
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


Liquid::Template.register_tag('theorem', Jekyll::TheoremsEquations::TheoremBlock)
Liquid::Template.register_tag('lemma', Jekyll::TheoremsEquations::TheoremBlock)
Liquid::Template.register_tag('proposition', Jekyll::TheoremsEquations::TheoremBlock)
Liquid::Template.register_tag('definition', Jekyll::TheoremsEquations::TheoremBlock)
Liquid::Template.register_tag('notation', Jekyll::TheoremsEquations::TheoremBlock)
Liquid::Template.register_tag('remark', Jekyll::TheoremsEquations::TheoremBlock)
Liquid::Template.register_tag('note', Jekyll::TheoremsEquations::TheoremBlock)
Liquid::Template.register_tag('observation', Jekyll::TheoremsEquations::TheoremBlock)
Liquid::Template.register_tag('question', Jekyll::TheoremsEquations::TheoremBlock)

Liquid::Template.register_tag('equation', Jekyll::TheoremsEquations::EquationTag)
