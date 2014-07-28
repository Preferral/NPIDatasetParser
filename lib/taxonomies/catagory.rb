module Taxonomies
  class Catagory
    include Mongoid::Document
    has_many :types

    field :name, type: String
  end
end
