module Taxonomies
  class Specialty
    include Mongoid::Document
    has_and_belongs_to_many :providers, class_name: 'Providers::Provider'

    field :name, type: String
    field :taxonomy, type: String
    field :active, type: Boolean
    field :description, type: String
  end
end
