class Store < ActiveRecord::Base
    has_many :categories
    has_many :colections
end
