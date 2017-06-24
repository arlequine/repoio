# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MyEmail < ActiveRecord::Base
    validates_presence_of :email, message: "Olvidaste colocar correo!"
    validates_uniqueness_of :email, message: "Este correo ya está en uso"
    validates_format_of :email, with: Devise::email_regexp, message: "No has enviado tu correo!" 
end
