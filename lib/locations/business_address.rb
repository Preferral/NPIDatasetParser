module Locations
  class BusinessAddress
    include Mongoid::Document
    include Geocoder::Model::Mongoid
    after_validation :geocode
    belongs_to :provider, class_name: 'Providers::Provider'

    geocoded_by :address

    validates_presence_of :first_line
    validates_presence_of :city
    validates_presence_of :state
    validates_presence_of :postal_code

    field :first_line, type: String
    field :second_line, type: String
    field :city, type: String
    field :state, type: String
    field :postal_code, type: String
    field :country_code, type: String
    field :telephone_number, type: String
    field :fax_number, type: String

    field :coordinates, type: Array

    def address
      if first_line && city && state && postal_code
        if second_line.blank?
          return "#{first_line}, #{city}, #{state}, #{postal_code.first(5)}"
        else
          return "#{first_line}, #{second_line}, #{city}, #{state}, #{postal_code.first(5)}"
        end
      end
    end

  end
end
