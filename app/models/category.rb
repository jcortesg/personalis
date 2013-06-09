class Category
  include Mongoid::Document
  field :name, type: String
  field :raking, type: String

  belongs_to :user
  embeds_many :subcategories
end
