class Callout < Asset
  belongs_to :page
  has_attached_file :image,
    :styles => {
      :thumb  => "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :large  =>   "400x400>" }
  translates :text, :title
  accepts_nested_attributes_for :globalize_translations 
end