class CssDocument < ActiveRecord::Base
   has_many :revisions, :as => revisionable
   belongs_to :document
end
