# frozen_string_literal: true

class Order < ApplicationRecord
  has_one_attached :file

  validates :imei, presence: true
  validates :annual_price, presence: true
  validates :device_model, presence: true
  validates :installments, presence: true

  validates :imei, uniqueness: true

  validates :annual_price, numericality: { greater_than: 0 }
  validates :installments, numericality: { greater_than: 0, less_than: 13 }
  validates :imei, numericality: { greater_than: 0 }
end
