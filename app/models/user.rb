class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [ :facebook ]

  has_many :orders
  after_create :send_welcome_email

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  # def save_stripe_token(customer)
  #   stripe_customer_token = customer.id
  #   self.save
  #   rescue Stripe::InvalidRequestError => e
  #     logger.error "Erreur Stripe : #{e.message}"
  #     errors.add :base, "There was a problem with your credit card."
  #     false
  # end

  def deposit(amount_in_cents, card)
    customer = stripe_customer

    Stripe::Charge.create(
      amount: amount_in_cents,
      currency: 'eur',
      customer: customer.id,
      card: card.id,
      description: "Charge for #{email}"
    )

    customer.account_balance += amount
    customer.save
  rescue => e
    false
  end

  def ready?
    if first_name.nil? || last_name.nil? || street.nil? || city.nil? || zipcode.nil?
      false
    else
      true
    end
  end

  def stripe_customer
    @stripe_customer ||= (
      ensure_stripe_customer!
      Stripe::Customer.retrieve(stripe_customer_token)
    )
  end

  def ensure_stripe_customer!
    return if stripe_customer_token.present?

    @stripe_customer = Stripe::Customer.create(
      :email => email,
      :description => name,
    )
    update_attribute(:stripe_customer_token, @stripe_customer.id)
  end

  def create_card(stripe_token)
    card = stripe_customer.sources.create(card: stripe_token)

    card.name = name
    card.address_line1 = street if !street.blank?
    card.address_city = city if !city.blank?
    card.address_zip = zipcode if !zipcode.blank?
    card.address_country = "France"
    card.save
    card
  end

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.street}, #{self.zipcode}"
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end

end
