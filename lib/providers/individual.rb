module Providers
  class Individual < Providers::Provider
    field :last_name, type: String
    field :first_name, type: String
    field :middle_name, type: String
    field :name_prefix, type: String
    field :name_suffix, type: String
    field :provider_credential, type: String
    field :other_last_name, type: String
    field :other_first_name, type: String
    field :other_middle_name, type: String
    field :other_name_prefix, type: String
    field :other_name_suffix, type: String
    field :other_provider_credential, type: String
    field :other_last_name_type_code, type: String
  end
end
