class BankAccount
  # code here
  attr_reader :name
  attr_accessor :balance, :status
  def initialize(name)
    @name=name
    @status="open"
    @balance=1000
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    @status=="open" && @balance > 0
  end

  def close_account
    @status="closed"
  end
end
