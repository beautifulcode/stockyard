module AssetsHelper
  def asset_tag_for(asset, *args, &block)
    div_for(asset, {:class => 'asset'}, &block) + link_to('Edit', edit_polymorphic_path(asset))
  end
end
