module AssetsHelper
  def asset_tag_for(asset, *args, &block)
    html = div_for(asset, {:class => 'asset'}, &block)
    html << link_to('Edit', edit_polymorphic_path(asset))
    html
  end
end
