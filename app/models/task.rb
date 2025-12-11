class Task < ApplicationRecord
  validates :description, presence: true, length: { maximum: 100 }

  before_destroy :check_done_status

  def check_done_status
    p " check_done_status "
    p "done status: #{done}"
    if !done
      p " add error !"
      errors.add(:base, "Cannot delete a task that is not done.")
      throw :abort
    end
  end
end
