class User < ApplicationRecord
  has_secure_password

  def self.deliver(id)
  	find(id).deliver
  end

  def deliver
  	sleep 10 # simulate long email delivery
  	raise "foo"
  	update_attribute(:delivered_at, Time.zone.now)
  end
end