class Product
  include Mongoid::Document

  field :sku, type: String
  field :name, type: String
  field :price, type: Float
  field :barcode, type: String
  field :amount, type: Integer
  field :description, type: String

  validates :sku, presence: true, format: { with: /\A[a-zA-Z-]*\z/, message: "The SKU field must contain only alphanumerics and hyphen" }
  validates :name, presence: true
  validates :price, numericality: {greater_than: 0 }
  validates :amount, presence: true
  validates :description, presence: true
  validates :barcode, length: { in: 8..13 }
  
  def as_json(*args)
    hash = super()
    hash['id'] = hash.delete('_id').to_s
    hash.as_json(only: %w[id sku name price barcode amount description ])
  end

end