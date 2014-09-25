module DataProcessing
  module Stream
    class RowObjectBuilder
      attr_accessor :object

      def initialize(row, tax_cache)
        @tax_cache = tax_cache
        @row = Row.new(row)
      end

      def objectify
        if @row.active? and @row.entity_type != 'HeaderRow'
          if @row.entity_type == 'Individual'
            @object = create_individual_provider
          elsif @row.entity_type == 'Organization'
            @object = create_organization_provider
          else
            raise 'Invalid Data'
          end
          associate_taxonomies if @object
          associate_addresses if @object
          @object.save if @object
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

        specs = @tax_cache.find(taxonomy_codes)
        @object.specialties = specs
      end

      def associate_addresses
        address1 = Locations::MailingAddress.new(@row.mailing_address_attributes)
        address2 = Locations::PracticeAddress.new(@row.practice_address_attributes)
        @object.addresses = [
          (address1.valid? ? address1 : nil),
          (address2.valid? ? address2 : nil)
        ].compact
      end
    end
  end
end
