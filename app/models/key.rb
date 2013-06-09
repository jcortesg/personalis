class Key
  include Mongoid::Document
  field :name, type: String
  field :value, type: Integer

  belongs_to :category


end
