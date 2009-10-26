class TextBlock < Asset
  
  # belongs_to :nested_image, :class => "BasicImage", :foreign_key => :nested_image_id
  
  translates :content
  accepts_nested_attributes_for :globalize_translations 
end
