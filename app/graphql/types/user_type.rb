class Types::UserType < Types::BaseObject
  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :full_name, String, null: true
  field :full_address, String, null: true
  field :street, String, null: true
  field :number, String, null: true
  field :city, String, null: true
  field :postcode, String, null: true
  field :country, String, null: true
  field :posts, [Types::PostType], null: true

  def posts
    Post.where(user_id: object.id)
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def full_address
    "Country: #{object.country}, City: #{object.city}, Street: #{object.street}, PostCode:#{object.postcode}"
  end
end

class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "User attributes"
  argument :id, Integer, required: false
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :street, String, required: false
  argument :number, String, required: false
  argument :city, String, required: false
  argument :postcode, String, required: false
  argument :country, String, required: false
end
