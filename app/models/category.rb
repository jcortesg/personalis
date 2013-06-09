class Category
  include Mongoid::Document
  field :name, type: String
  field :raking, type: String
end
