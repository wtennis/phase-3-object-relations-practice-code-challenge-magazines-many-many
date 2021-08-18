class Subscription < ActiveRecord::Base
  belongs_to :magazine
  belongs_to :reader

  def print_details
    puts "#{Reader.find(self.reader_id).name} subscribed to #{Magazine.find(self.magazine_id).title} for $#{self.price}"
  end


end