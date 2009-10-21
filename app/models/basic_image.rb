class BasicImage < Asset
  belongs_to :page
  translates :title, :caption
  # Paperclip
  has_attached_file :file,
    :styles => {
      :thumb  => "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :large  =>   "400x400>" }
      
      
  def upload_permalink
    file.url
  end
end
