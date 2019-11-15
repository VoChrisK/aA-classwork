# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :text             not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

class ShortenedUrl < ApplicationRecord
    validates :user_id, :long_url, :short_url, uniqueness: true, presence: true

    belongs_to :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ShortenedUrl'

    def self.random_code
        short_url = SecureRandom.urlsafe_base64
    end
end
