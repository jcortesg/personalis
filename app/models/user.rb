class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Information TW

  field :provider , :type => String
  field :uid , :type => String
  field :username , :type => String
  field :image , :type => String
  field :password , :type => String
  field :location , :type => String
  field :description , :type => String
  field :followers, :type => Integer
  field :name , :type => String
  field :friends , :type => Integer
  field :token , :type => String
  field :secret , :type => String

  ##Relations

  has_many :categories
  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # run 'rake db:mongoid:create_indexes' to create indexes
  
  field :name, :type => String
  
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :created_at, :updated_at


  has_many :campaigns

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end

  end


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.email = auth.info.mail
      user.image = auth.info.image
      user.password = Devise.friendly_token[0,20]
      user.description = auth.info.description
      user.location = auth.info.location
      user.followers = auth.extra.raw_info.followers_count.to_i
      user.name = auth.info.name
      user.friends = auth.extra.raw_info.friends_count.to_i
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
    end

  end

def email_required?
  super && provider.blank?
end

end
