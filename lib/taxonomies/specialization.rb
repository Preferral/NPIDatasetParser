module Taxonomies
  class Specialization < Taxonomies::Specialty
    belongs_to :classification
  end
end
