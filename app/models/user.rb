class User < ActiveRecord::Base
#attr_accessor :password
  #attr_accessible :name, :contactno, :address, :email, :password, :password_confirmation
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :presence => true, :length => { :in => 3..60 }
  validates :contactno, :presence => true, :uniqueness => true, :length => { is: 10 }
  validates :address, :presence => true
  validates :email, :presence => true, :uniqueness => true , :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..30, :on => :create
  before_save :downcase_fields

   def downcase_fields
      self.email.downcase!
   end
  
  def self.authenticate(login, pwd)
    #find(:first, :conditions=>["email = ? AND password = ?", login, pwd])
    find_by email: login, password: pwd
  end
end
