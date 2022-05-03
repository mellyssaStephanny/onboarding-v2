class Product
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name Rails.application.class.parent_name.underscore
  document_type self.name.downcase

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :name, analyzer: 'portuguese'
      indexes :description, analyzer: 'portuguese'

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

  def as_indexed_json(options = nil)
    self.as_json( only: [ :name, :description ] )
  end

  def self.search(query)
    __elasticsearch__.search(
    {
      query: {
         multi_match: {
           query: query,
           fields: ['name', 'description']
         }
       },
    }
  end
end
