# == Schema Information
#
# Table name: kitchens
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  cuisine        :string           not null
#  cost           :integer          not null
#  phone_number   :string           not null
#  menu           :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  lat            :float            not null
#  lng            :float            not null
#  number_reviews :integer          default(0)
#  description    :text             not null
#  host_infor     :text             not null
#  average_rating :float
#  location_id    :integer          not null
#  region         :string           not null
#

require 'test_helper'

class KitchenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
