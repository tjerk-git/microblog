class Newsletter < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_one :book
end
