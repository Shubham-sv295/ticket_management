class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :twitter, :linkedin]
  
  # validations
  validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/,
    message: "only allows letters" }
  validates :mob_no, length: { is: 10}, numericality: { only_integer: true}
  has_one_attached :avatar 
  
  enum role: [:customer,:manager,:admin]

  #Associations
  has_many :tickets
  has_many :assign_tickets, foreign_key: "manager_id", class_name:"Ticket"
  has_and_belongs_to_many :subjects, join_table: "managers_subjects" ,foreign_key: "manager_id"
  has_many :comments, foreign_key: "author_id"
  #varaible for comment
  attr_accessor :content

  after_create :welcome_mail
  
  def welcome_mail
    if self.customer?
      message = "Hi Mr. #{self.name} Welcome to Ticket Management App \n Your login credentials are \n user_name : #{self.email} \n password : #{self.password}"
      TwilioTextMessenger.new(message, self.mob_no).call
      UserMailer.with(user: self).customer_welcome_email.deliver
    elsif self.manager?
      message = "Hi Mr. #{self.name} Welcome to Ticket Management App And Congrats for being manager \n Your login credentials are \n user_name : #{self.email} \n password : #{self.password}"
      TwilioTextMessenger.new(message, self.mob_no).call
      UserMailer.with(user: self).manager_welcome_email.deliver
    end
  end

  def self.create_from_provider_data(provider_data)
    where(email: provider_data.info.email).first_or_initialize do | user |
      user.uid = provider_data.uid
      user.provider = provider_data.provider
      user.email = provider_data.info.email
      user.name = provider_data.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end
end