class Product < ActiveRecord::Base
    belongs_to :colection
    has_many :tag
end
