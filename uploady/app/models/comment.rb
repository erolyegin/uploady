class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
end

#rails g model comment user:re