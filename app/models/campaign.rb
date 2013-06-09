class Campaign
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  has_many :categories
end
