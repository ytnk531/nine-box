class Answer < ApplicationRecord
  belongs_to :solver, class_name: 'User', optional: true
end
