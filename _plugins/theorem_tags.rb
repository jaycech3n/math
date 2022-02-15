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

        def render(type, desc, slug, numbering_html, body)
          "<div class='#{type} block' id='#{slug}' markdown=1>"\
            "<span class='block-label'><span class='type'>#{type}</span>"\
            "#{numbering_html}#{"<span class='desc'>#{desc}</span>" unless desc.blank? || desc.empty?}</span>" +
            body +
          "</div>"
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
        Helper::render(@type, @desc, @slug, numbering_html, super)
      end
    end

    # Proof blocks are never added to the counter.
    class ProofBlock < Liquid::Block
      def initialize(type, desc, tokens)
        super
        @type = type
        @desc = desc.strip
        @slug = Jekyll::Utils.slugify(@desc, mode: 'pretty')
      end

      def render(context)
        Helper::render(@type, @desc, @slug, "", super)
      end
    end

    # Label block counters are always available.
    class LabelBlock < Liquid::Block
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
        Helper::render(@type, "", @slug, numbering_html, super)
      end
    end

  end
end


Liquid::Template.register_tag('theorem', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('lemma', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('proposition', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('definition', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('notation', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('remark', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('note', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('observation', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('question', Jekyll::TheoremTags::TheoremBlock)
Liquid::Template.register_tag('conjecture', Jekyll::TheoremTags::TheoremBlock)

Liquid::Template.register_tag('proof', Jekyll::TheoremTags::ProofBlock)

Liquid::Template.register_tag('labeled', Jekyll::TheoremTags::LabelBlock)
