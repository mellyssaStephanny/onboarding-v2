class Product
  include Mongoid::Document
  field :sku, type: String
  field :name, type: String
  field :price, type: Float
  field :amount, type: Integer
  field :description, type: String
 
  validates :sku, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  validates :description, presence: true
  
  def as_json(*args)
    hash = super()
    hash['id'] = hash.delete('_id').to_s
    hash.as_json(only: %w[id sku name price amount description ])
  end
end
