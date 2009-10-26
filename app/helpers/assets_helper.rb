module AssetsHelper
  def asset_tag_for(asset, *args, &block)
    html = div_for(asset, {:class => 'asset'}, &block)
    # html << link_to('Edit', edit_polymorphic_path(asset))
    html
  end
  
  def editable?(content)
    true if logged_in?
  end
  
  def available_asset_types
    %w( TextBlock BasicImage NewsItem Callout CodeSnippet FlashPiece Article )
  end
end
