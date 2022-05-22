class BasicSerializer
  include JSONAPI::Serializer

  attribute :public_id, &:id
end
