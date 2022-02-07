# This uses a janky global singleton class for now because I haven't figured out
# how to pass data to individual pages yet.

module Jekyll
  class Numbering < Jekyll::Plugin
    priority :high # make sure this loads before plugins that depend on it

    class << self
      attr_accessor :sec_numbers, :thm_numbers, :numbers_start,
        :section, :subsection, :subsubsection, :counter, :index

      def init(page)
        thm_numbers = page.data["theorem-numbers"]
        sec_numbers = page.data["section-numbers"]
        numbers_start = if page.data["numbers-start"] then page.data["numbers-start"].to_i else 1 end
        @sec_numbers=(sec_numbers)
        @thm_numbers=(thm_numbers)
        @numbers_start=(numbers_start)
        @section=(-1)
        @subsection=(-1)
        @subsubsection=(-1)
        @counter=(-1)
        @index=(Hash.new)
      end

      def set_section(n)
        @section=(n)
        @subsection=(-1)
        @subsubsection=(-1)
        @counter=(-1)
      end

      def set_subsection(n)
        @subsection=(n)
        @subsubsection=(-1)
        @counter=(-1)
      end

      def set_subsubsection(n)
        @subsubsection=(n)
        @counter=(-1)
      end

      def incr_section
        set_section(@section + 1)
      end

      def incr_subsection
        set_subsection(@subsection + 1)
      end

      def incr_subsubsection
        set_subsubsection(@subsubsection + 1)
      end

      def incr_counter
        @counter=(@counter + 1)
      end

      def use_section
        if @section < 0 then set_section(@numbers_start) else incr_section end
        [@section]
      end
      
      def use_subsection
        if @subsection < 0 then set_subsection(@numbers_start) else incr_subsection end
        [@section, @subsection]
      end

      def use_subsubsection
        if @subsubsection < 0 then set_subsubsection(@numbers_start) else incr_subsubsection end
        [@section, @subsection, @subsubsection]
      end

      def use_counter
        if @counter < 0 then @counter=(@numbers_start) else incr_counter end
        n = @counter
        if @sec_numbers
          [@section, @subsection, @subsubsection, n].filter {|m| m >= 0}
        else
          [n]
        end
      end
    end
  end
end

Jekyll::Hooks.register :pages, :post_init do |page|
  Jekyll::Numbering.init(page)
end

Jekyll::Hooks.register :documents, :pre_render do |page|
  Jekyll::Numbering.init(page)
end
