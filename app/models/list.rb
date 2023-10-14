class List < ApplicationRecord
    validates :title, presence: true, length: {maximum:20}
    validates :start, presence: true
    validates :finish, presence: true
    validate :start_finish_check
    validate :start_check
    
    validates :memo, {length: {maximum:500}}

    def start_finish_check
        errors.add(:終了日, "は開始日より遅い日付を選択してください") if start > finish
    end
    
    def start_check
        errors.add(:開始日, "は現在の日時より遅い日付を選択してください") if start < Time.now
    end
end
