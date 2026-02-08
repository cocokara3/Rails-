class Schedule < ApplicationRecord
  # 必須入力の設定
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  # メモの最大文字数
  validates :memo, length: { maximum: 500 }

  # 独自のチェック（終了日が開始日より前でないか）
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?

    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付を選択してください")
    end
  end
end
