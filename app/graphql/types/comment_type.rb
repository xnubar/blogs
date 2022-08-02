class Types::CommentType < Types::BaseObject
  field :post_id, Integer, null: false
  field :body, String, null: false
end
