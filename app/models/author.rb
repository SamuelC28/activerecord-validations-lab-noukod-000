class Author < ActiveRecord::Base
   validates :name, presence: { strict: true }
end
