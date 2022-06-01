class Todo < ApplicationRecord
  belongs_to :user

  after_update_commit do
    broadcast_append_to("broadcast_to_user_#{self.user_id}") if self.complete?
    broadcast_prepend_to("broadcast_to_user_#{self.user_id}") if self.incomplete?
  end

  after_create_commit do
    broadcast_prepend_to(
      "broadcast_to_user_#{self.user_id}",
      target: 'notices',
      partial: "notices/notice",
      locals: { todo: self }
    )
  end

  validates :title, presence: true
  enum status: { incomplete: 0, complete: 1 }

end
