class Manager < ActiveRecord::Base
	acts_as_translator
  attr_accessible :email, :password
end