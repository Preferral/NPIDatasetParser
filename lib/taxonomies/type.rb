module Taxonomies
  class Type
    include Mongoid::Document
    belongs_to :catagory
    has_many :classifications

    field :name, type: String
    field :description, type: String
  end
end
