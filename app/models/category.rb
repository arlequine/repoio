class Category < ActiveRecord::Base
    belongs_to :store
    has_many :colections
end
