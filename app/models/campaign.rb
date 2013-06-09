class Campaign
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :influenciador , type: String

  has_many :categories
  belongs_to :user
end
