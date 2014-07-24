module Locations
  class BusinessAddress
    include Mongoid::Document
    # include Geocoder::Model::Mongoid
    field :first_line, type: String
    field :second_line, type: String
    field :city, type: String
    field :state, type: String
    field :postal_code, type: String
    field :country_code, type: String
    field :telephone_number, type: String
    field :fax_number, type: String

    field :coordinates, type: Array

  end
end
