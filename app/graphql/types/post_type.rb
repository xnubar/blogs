class Types::PostType < Types::BaseObject
  field :user_id, Integer, null: false
  field :body, String, null:true
  field :comments, [Types::CommentType], null: true

  def comments
    Comment.where(post_id: object.id)
  end
end

class Types::PostInputType < GraphQL::Schema::InputObject
  graphql_name "PostInputType"
  argument :id, Integer, required: false
  argument :user_id, Integer, required: true
  argument :body, String, required: true
end
