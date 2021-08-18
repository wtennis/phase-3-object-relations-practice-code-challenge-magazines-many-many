class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions


  def email_list
    list = self.subscriptions.map do |sub|
        Reader.find(sub.reader_id).email
    end
    list = list.join(';')
    puts list
    list
  end

  def self.most_popular
    subsc = Subscription.group('magazine_id').order('count(*)').last
    # count = Subscription.find_by(magazine_id: subsc.magazine_id).count
    mag = Magazine.find(subsc.magazine_id)
    puts "#{mag.title} is the most popular!"
    mag
  end


end