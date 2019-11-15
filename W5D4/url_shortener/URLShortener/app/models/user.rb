# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
    validates :username, :email, uniqueness: true, presence: true

    has_many :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ShortenedUrl'

    def self.shortened_url(long_url)
        shortened_url = ShortenedUrl.new(long_url) 
    end
end
