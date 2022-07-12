# frozen_string_literal: true

module Orders
  class Destroy < Actor
    input :id, type: String

    def call
      order = Order.find(id)
      order.destroy!
    rescue StandardError => e
      fail!(error: e.message)
    end
  end
end
