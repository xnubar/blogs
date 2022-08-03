class Types::CommentType < Types::BaseObject
  field :post_id, Integer, null: false
  field :body, String, null: false
end

class Types::CommentInputType < GraphQL::Schema::InputObject
  graphql_name "CommentInputType"
  argument :id, Integer, required: false
  argument :post_id, Integer, required: true
  argument :body, String, required: true
end
