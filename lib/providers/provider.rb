module Providers
  class Provider
    include Mongoid::Document
    field :npi, type: String
    field :replacement_npi, type: String
    field :ein, type: String

    has_many :addresses, class_name: 'Locations::BusinessAddress', dependent: :destroy
    has_and_belongs_to_many :specialties, class_name: 'Taxonomies::Specialty'
  end
end
