
class User < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, uniqueness: {case_sensitive: false} ,
            presence: true , length: { maximum: 90},
            format: {with: VALID_EMAIL_REGEX}

  has_many :useraddress
  has_many :order

  settings do
    mappings dynamic: false do
      indexes :email, type: :text
      indexes :user_name, type: :text
      indexes :is_admin, type: :boolean
    end
  end

  def self.search_all(query)
    self.search({
                    query: {
                        bool: {
                            must: [
                                {
                                    multi_match: {
                                        query: query,
                                        fields: [:email, :user_name]
                                    }
                                }]
                        }
                    }
                })
  end

end
