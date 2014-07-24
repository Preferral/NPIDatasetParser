module Providers
	class Provider
	  include Mongoid::Document
	  field :npi, type: String
	  field :replacement_npi, type: String
	  field :ein, type: String

	  embeds_many :addresses, class_name: 'Locations::BusinessAddress'
	end
end
