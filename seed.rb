require "#{File.dirname(__FILE__)}/config/development.rb"


tax = Hashie::Mash.new(JSON.parse(File.open(TAXONOMY_FILE_NAME).read))

tax.catagories.each do |cat|
  catagory = Taxonomies::Catagory.create(name: cat.name)
  puts catagory.name

  cat.types.each do |ty|
    type = Taxonomies::Type.create(name: ty.name, description: ty.description)
    puts "\t- #{type.name}"

    ty.classifications.each do |clas|
      classification = Taxonomies::Classification.create(name: clas.name, taxonomy: clas.taxonomy, active: clas.active, description: clas.description)
      puts "\t\t- #{clas.name}"

      if clas.specializations
        clas.specializations.each do |spec|
          specialization = Taxonomies::Specialization.create(name: spec.name, taxonomy: spec.taxonomy, active: spec.active, description: spec.description)
          puts "\t\t\t- #{spec.name}"
          classification.specializations.push specialization
        end
      end
      type.classifications.push classification
    end
    catagory.types.push type
  end
end

