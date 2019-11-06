class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User"

  validate :start_date_cannot_be_in_the_past, :duration_multiple_of_5

  validates :start_date, presence: true

  validates :duration, presence: true, numericality: {greather_than: 0}

  validates :title, presence: true, length: {in: 5..140}

  validates :description, presence: true, length: {in: 20..1000}

  validates :price, presence: true, numericality: {greather_than: 0, less_than: 1000}

  validates :location, presence: true

  def start_date_cannot_be_in_the_past
    if start_date.blank? && if start_date < Date.today
      errors.add(:start_date, "Tu arrive a retourner dans le passé toi ??")
    end
  end

  def duration_multiple_of_5
   return if duration.blank? #on sors de la boucle
    if duration % 5 != 0
        errors.add(:duration, "C'est plus facile par 5 tu trouve pas ?")
    end
  end
end
