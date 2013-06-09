class Subcategory
  include Mongoid::Document
  field :name, type: String
  field :raking, type: String

  embedded_in :categoty

end
