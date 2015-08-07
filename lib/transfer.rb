class Transfer
  # code here
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance < amount
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    else
      unless @status == "complete" || @status == "rejected"
        sender.balance -= amount
        receiver.balance += amount
        @status="complete"
      end
    end
  end
  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end
