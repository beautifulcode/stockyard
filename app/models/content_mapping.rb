class ContentMapping < ActiveRecord::Base
  belongs_to :section
  belongs_to :page
  belongs_to :asset, :polymorphic => true
end
