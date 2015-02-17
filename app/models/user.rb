class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [ :facebook ]

  has_many :orders

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.name = auth.info.name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def save_stripe_token(customer)
    stripe_customer_token = customer.id
    self.save
    rescue Stripe::InvalidRequestError => e
      logger.error "Erreur Stripe : #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.street}, #{self.zipcode}"
  end

end
