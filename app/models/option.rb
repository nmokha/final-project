# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  decision_id :integer
#  description :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Option < ApplicationRecord
    
belongs_to :user
belongs_to :decision
    
end
