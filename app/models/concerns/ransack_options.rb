module RansackOptions
  extend ActiveSupport::Concern

  included do

    ransacker :created_at, type: :date do
      Arel.sql('date(created_at)')
    end

    def self.ransackable_associations(auth_object = nil)
      ["dish", "user"]
    end

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "dish_id", "dish_weight", "id", "status", "updated_at", "user_id"]
    end

  end
end
