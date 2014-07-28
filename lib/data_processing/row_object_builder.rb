module DataProcessing
  class RowObjectBuilder
    attr_accessor :object

    def initialize(row)
      @row = Row.new(row)
    end

    def objectify
      if @row.active?
        if @row.entity_type == 'Individual'
          @object = create_individual_provider
        elsif @row.entity_type == 'Organization'
          @object = create_organization_provider
        else
          raise 'Invalid Data'
        end
        associate_taxonomies if @object
        associate_addresses if @object
        puts @object.name if @object
      end
    end

    private

    def create_individual_provider
      Providers::Individual.create(@row.individual_provider_attributes)
    end

    def create_organization_provider
      Providers::Organization.create(@row.organization_provider_attributes)
    end

    def associate_taxonomies
      taxonomy_codes = @row.taxonomy_codes

      Taxonomies::Specialty.in(taxonomy: taxonomy_codes).each do |spec|
        @object.specialties << spec
      end
    end

    def associate_addresses
      address1 = Locations::MailingAddress.create(@row.mailing_address_attributes)
      address2 = Locations::PracticeAddress.create(@row.practice_address_attributes)
      @object.addresses << address1 if address1.valid?
      @object.addresses << address2 if address2.valid?
      @object.save
    end
  end
end
