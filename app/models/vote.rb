class Vote < ActiveRecord::Base
  attr_accessible :content_id, :content_type, :user_id

  belongs_to :content, :polymorphic => true
  belongs_to :user

end
