# frozen_string_literal: true

# Note is a user-posted note which other users may "like".
class Note < ApplicationRecord
  include ActiveModel::Validations

  SUMMARY_LENGTH = 35
  DIGEST_LIMIT = 25

  validates :identifier, presence: true, uniqueness: true
  validates_format_of :identifier, with: /[a-zA-Z]+/
  validates :text, presence: true

  has_many :likes, autosave: true, dependent: :destroy

  scope :best, -> { order('likes_count DESC, id DESC').limit(DIGEST_LIMIT) }
  scope :newest, -> { order('id DESC') }

  # Generate a three-word identifier string.
  def self.generate_identifier
    RandomWord.instance.format('%a %a %n').titleize.delete ' '
  end

  # Notes are primarily identified by their string identifier.
  def to_param
    identifier
  end

  # Summarize the note, returning an abbreviated string of its text.
  def summary
    summary = text.mb_chars.slice(0, SUMMARY_LENGTH).to_s
    summary << '…' if summary.mb_chars.length < text.mb_chars.length

    summary
  end
end
