class User < ActiveRecord::Base
  has_one :user_profile
  has_many :contents
  has_many :user_courses
  has_many :courses, through: :user_courses
  rolify
  validates_presence_of :name

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end