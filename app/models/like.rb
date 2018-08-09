# frozen_string_literal: true

# Like is representation of a user "liking" a Note.
class Like < ApplicationRecord
  belongs_to :note, counter_cache: true
end
