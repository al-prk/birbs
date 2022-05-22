class TaskAccounting
  include Interactor

  delegate :task, :account, :delta, to: :context

  def call
    account.update(total: account.total += delta)
  end

  private

  def new_total
    account.total += delta
  end

  def delta
    context.delta = if taks['status'] = 'new' then
      - task['credit_price']
    else
      task['debit_price']
    end
  end

  def account
    Account.find_by user_id: message['user_id']
  end
end