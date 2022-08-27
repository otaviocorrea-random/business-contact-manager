module RegexHelper
  extend ActiveSupport::Concern

  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
end