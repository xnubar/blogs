module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField


    field :user, Types::UserType, null: true, description: "Returns user object"do
      argument :id, Integer, required: true
    end
    def user(id:)
      User.find_by(id: id)
    end

    field :post, Types::PostType, null: true, description: "Returns post object"do
      argument :id, Integer, required: true
    end
    def post(id:)
      Post.find_by(id: id)
    end

    field :comment, Types::CommentType, null: true, description: "Returns comment object"do
      argument :id, Integer, required: true
    end
    def comment(id:)
      Comment.find_by(id: id)
    end

  end
end
