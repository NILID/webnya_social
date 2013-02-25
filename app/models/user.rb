class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_one :setting

  after_create :init_setting

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :roles

  extend FriendlyId
  friendly_id :login, use: :slugged

  validates :login, :presence => true, :uniqueness => true
  validates_format_of :login, :with => /\A[A-Za-z0-9_]+\z/
  validates_length_of :login, :maximum => 9



  ROLES = %w[admin user moderator]

  def roles=(roles)
      self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
      ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role?(role)
      roles.include? role.to_s
  end

  private
  def init_setting
    setting = self.build_setting
    setting.save!
  end
end
