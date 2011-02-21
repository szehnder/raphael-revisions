class Image < ActiveRecord::Base
  has_many :revisions, :as => revisionable
end
