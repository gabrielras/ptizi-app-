# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    imei { 448 }
    annual_price { 1000 }
    device_model { 'Iphone' }
    installments { 4 }
  end
end
