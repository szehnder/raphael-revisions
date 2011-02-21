class Revision < ActiveRecord::Base
  belongs_to :revisionable, :polymorphic => true
end
