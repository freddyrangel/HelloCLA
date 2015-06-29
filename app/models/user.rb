class User < ActiveRecord::Base
  validates :email,     presence: true, uniqueness: true
  validates :nickname,  presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.email    = auth.info.try(:email)
      user.name     = auth.info.try(:name)
      user.nickname = auth.info.try(:nickname)
    end
  end
end
