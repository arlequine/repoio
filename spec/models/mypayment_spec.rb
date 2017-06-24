# == Schema Information
#
# Table name: mypayments
#
#  id               :integer          not null, primary key
#  email            :string
#  ip               :string
#  status           :string
#  fee              :decimal(6, 2)
#  paypal_id        :string
#  total            :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shopping_cart_id :integer
#

require 'rails_helper'

RSpec.describe Mypayment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
