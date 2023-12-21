class Result < ApplicationRecord
  belongs_to :patient

  has_many :lab_studies

  validates_presence_of :lab_id, :lab_code, :tested_at
end
