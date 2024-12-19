class Schedule < ApplicationRecord
    validates :title, presence: { message: "を入力してください。" }
    validates :title, length: { maximum: 20, message: "は20文字以内で入力してください。" }
    validates :start_date, presence: { message: "を入力してください。" }
    validates :end_date, presence: { message: "を入力してください。" }
    validates :memo, length: { maximum: 500, message: "は500文字以内で入力してください。" }
    validate :end_date_after_start_date

    private
  
    def end_date_after_start_date
      if end_date.present? && start_date.present? && end_date < start_date
        errors.add(:end_date, "開始日より後の日付を選んでください。")
      end
    end
end
