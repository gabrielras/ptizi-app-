# frozen_string_literal: true

module Orders
  class Create < Actor
    input :attributes, type: Hash

    output :order, type: Order

    def call
      self.order = Order.new(attributes)
      order.save!
    rescue StandardError => e
      fail!(error: e.message)
    end
  end
end
