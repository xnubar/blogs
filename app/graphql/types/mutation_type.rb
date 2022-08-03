module Types
  class MutationType < Types::BaseObject
    # Create mutations
    field :create_user, Types::UserType, mutation: Mutations::CreateUser
    field :create_post, Types::PostType, mutation: Mutations::CreatePost
    field :create_comment, Types::CommentType, mutation: Mutations::CreateComment

    # Update mutations
    field :update_user, Boolean, null: true, description: "It updates user"do
      argument :user, Types::UserInputType, required: true
    end
    def update_user(user:)
      User.find_by(id: user[:id]).update(user.to_h)
    end

    field :update_post, Boolean, null: true, description: "It updates post"do
      argument :post, Types::PostInputType, required: true
    end
    def update_post(post:)
      Post.find_by(id: post[:id]).update(post.to_h)
    end


    field :update_comment, Boolean, null: true, description: "It updates comment"do
      argument :comment, Types::CommentInputType, required: true
    end
    def update_comment(comment:)
      Comment.find_by(id: comment[:id]).update(comment.to_h)
    end


    # Delete mutations
    field :delete_user, Boolean, null: true, description: 'It deletes the user if exists'do
      argument :id, Integer, required: true
    end
    def delete_user(id:)
      User.where(id: id).destroy_all
      true
    end

    field :delete_post, Boolean, null: true, description: "It deletes the post if exists"do
      argument :id, Integer, required: true
    end
    def delete_post(id:)
      Post.where(id: id).destroy_all
      true
    end

    field :delete_comment, Boolean, null: true, description: "It deletes the comment if exists" do
      argument :id, Integer, required: true
    end
    def delete_comment(id:)
      Comment.where(id: id).destroy_all
      true
    end
  end
end
