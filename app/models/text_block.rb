class TextBlock < Asset
  translates :content
  accepts_nested_attributes_for :globalize_translations 
end
