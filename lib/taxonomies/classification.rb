module Taxonomies
  class Classification < Taxonomies::Specialty
    belongs_to :type
    has_many :specializations
  end
end
