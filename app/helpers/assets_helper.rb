module AssetsHelper
  def asset_tag_for(asset, *args, &block)
    div_for(asset, {:class => 'asset'}, &block)
  end
end
