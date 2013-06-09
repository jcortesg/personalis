class Category
  include Mongoid::Document
  field :name, type: String
  field :raking, type: String

  belongs_to :user
  belongs_to :campaigns
  embeds_many :subcategories

  accepts_nested_attributes_for :subcategories

end
