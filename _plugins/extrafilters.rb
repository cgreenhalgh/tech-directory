module Jekyll
  # I can't find a way to do this with stnadard filters :-/
  module TagFilter
    def uniq_tags(input, property = nil)
      tags = []
      input = Array(input)
      if !property.nil?
        input = input.map do |e| 
          e = e.call if e.is_a?(Proc)
          if e.respond_to?(:[])
            r = e[property]
            r.is_a?(Proc) ? r.call : r
          end
        end
      end
      for i in input
        for t in Array(i)
          if !t.nil? && !tags.include?(t)
            tags.push(t)
          end
        end
      end
      return tags
    end
  end

end

Liquid::Template.register_filter(Jekyll::TagFilter)
