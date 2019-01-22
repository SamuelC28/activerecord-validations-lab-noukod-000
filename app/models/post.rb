class Clickbait < ActiveModel::Validator
  def validate(title)
    # if record.title
    messages = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    messages.map do |msg|
      unless title.include? msg # { |t| record.title.include? t }
        record.errors[:title] << 'the title does not contain the words'
      end
     end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
   validates :title, presence: true
   validates :content, length: { minimum: 250 }
   validates :summary, length: {maximum: 250 }
   validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    # message: "%{value} is not a valid" }
    validates_with Clickbait

end
