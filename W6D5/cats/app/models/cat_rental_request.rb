class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, :inclusion => {:in => ['PENDING', 'APPROVED', 'DENIED']}, presence: true

  belongs_to :cat, 
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy

  def overlapping_requests
    requests = CatRentalRequest.where(cat_id: @cat_id)
  end
end