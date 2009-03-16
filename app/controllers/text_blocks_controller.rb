class TextBlocksController < AssetsController
  def new
    @text_block = TextBlock.new
  end
end
