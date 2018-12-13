# frozen_string_literal: true

# Like is a single user-created "like" event for a Note.
class Like < ApplicationRecord
  belongs_to :note, counter_cache: true
end
