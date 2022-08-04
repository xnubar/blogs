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

    field :login, String, null: true, description: "Handles login for user"do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def login(email:, password:)
      if user = User.find_by(email: email)&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :logout, Boolean, null: true, description: "Handles logout for user"
    def logout
      Session.where(id: context[:session_id]).destroy_all
      true
    end


    field :current_user, Types::UserType, null: true, description: "Fetches current user"
    def current_user
      context[:current_user]
    end


  end
end
