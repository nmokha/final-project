# == Schema Information
#
# Table name: decisions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Decision < ApplicationRecord

belongs_to :user
has_many :options, :dependent => :destroy


end
