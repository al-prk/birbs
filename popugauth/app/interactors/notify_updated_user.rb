class NotifyUpdatedUser
  include Interactor

  delegate :user, to: :context

  def call
    $producer.produce_sync(topic: 'update-user', payload: message)
  end

  private

  def message
    UserSerializer.new(user).as_json
  end
end