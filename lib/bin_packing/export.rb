module BinPacking
  class Export
    def initialize(*bins)
      @bins = Array(bins).flatten
    end

    def to_html(options = {})
      template_path = File.expand_path('../resources/export.html.erb', __FILE__)
      template = File.read(template_path)
      binding = ExportBinding.new(@bins, options[:zoom] || 1)
      html = ERB.new(template).result(binding.get_binding)
      html
    end
  end
end
