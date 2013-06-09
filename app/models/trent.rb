class Trent
  include Mongoid::Document
  field :category, type: String
  field :ranking, type: Integer

  embedded_in :user
end
