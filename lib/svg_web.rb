module SvgWeb

  def svg_include_tag
    javascript_src_tag "svg_web/svg.js", "data-path" => "/javascripts/svg_web"
  end
  
  def svg_tag(url, options = {})
    url = compute_public_path(url, "svgs", "svg")
    page = "<!--[if IE]>\n"
    page << content_tag( :object, nil, {:src => url, :classid => "image/svg+xml"}.merge(options) )
    page << "\n<![endif]--><!--[if !IE]>-->\n"
    page << content_tag( :object, nil, {:data => url, :type => "image/svg+xml"}.merge(options) )
    page << "\n<!--<![endif]-->"
    page
  end

  def embed_svg( content, options = {} )
    page =  '<script type="image/svg+xml">'
    page << '<![CDATA['
    page << content || "NO CONTENT"
    page << ']]>'
    page << '</script>'

    if options[:alt]
      page << '<noscript'
      page << "  #{options[:alt]}"
      page << '</noscript>'
    end

    page
  end
end

