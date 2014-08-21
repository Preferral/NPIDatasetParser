module DataProcessing
  class TaxonomyCache
    def initialize
      @@specialties = Taxonomies::Specialty.all[0..-1].group_by(&:taxonomy)
      @@specialties.each do |k, v|
        @@specialties[k] = v.first
      end
    end

    def find(*args)
      args.flatten!
      result = []
      args.each do |tax|
        if @@specialties.has_key?(tax)
          result << @@specialties[tax]
        end
      end
      result
    end
  end
end