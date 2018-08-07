require 'random_word'

class Note < ApplicationRecord
  include ActiveModel::Validations

  SUMMARY_LENGTH = 35.freeze

  validates :identifier, presence: true, uniqueness: true
  validates_format_of :identifier, :without => /\d/
  validates :text, presence: true

  has_many :likes, autosave: true, dependent: :destroy

  # Generate a three-word identifier string.
  def self.generate_identifier
    RandomWord.instance.format('%a %a %n').titleize.delete ' '
  end

  # Find a Note by its integer ID or string identifier.
  def self.find(input)
    if input.to_i > 0
      super
    else
      find_by_identifier(input)
    end
  end

  # Notes are identified by their string identifier.
  def to_param
    identifier
  end

  # Summarize the note, returning an abbreviated string of its text.
  def summary
    summary = text.mb_chars.slice(0, SUMMARY_LENGTH).to_s

    if summary.mb_chars.length < text.mb_chars.length
      summary += '…'
    end

    summary
  end
end
