class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions


  def subscribe(magazine, price)
    Subscription.create(magazine_id: magazine.id, price: price, reader_id: self.id)
  end


  def total_subscription_price
    total = 0
    self.subscriptions.map do |sub|
        total += sub.price
    end
    puts "You are paying $#{total} total for all your subscriptions"
    total
  end

  def cancel_subscription(mag)
    Subscription.find_by(magazine_id: mag.id, reader_id: self.id).destroy
  end

end