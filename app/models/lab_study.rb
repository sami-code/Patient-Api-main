class LabStudy < ApplicationRecord
  POS_NEG = %w[POSITIVE NEGATIVE].freeze
  COMPARE_SIGN = %w[< >].freeze
  
  belongs_to :result

  before_create :set_normal

  validates_presence_of :name, :code, :reference_range, :observation_value
  validates :name, length: { within: 3..99 }

  private

  def set_normal
    self.normal = if reference_range.upcase.in? POS_NEG
                    reference_range.casecmp?(observation_value)
                  elsif reference_range[0].in? COMPARE_SIGN
                    compare_val
                  elsif reference_range.include? '-'
                    compare_range
                  else
                    throw 'Invalid reference range'
                  end
  end

  def compare_val
    range_val = reference_range[1] == '=' && 1 || 0
    eval("#{observation_value.to_f} #{reference_range[0..range_val]} #{reference_range[(range_val + 1)..-1].to_f}")
  end

  def compare_range
    observation_value.to_f.between?(*reference_range.split('-').map(&:to_f))
  end
end
