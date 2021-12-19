class Post < ApplicationRecord
    has_rich_text :body
    has_many :hearts

    def loved?
        
    end
end
