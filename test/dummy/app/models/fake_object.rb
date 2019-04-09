module SpreeeedEngine
  class FakeObject < ApplicationRecord
    validates :name, presence: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }

    validates :email, presence: true
    validates :email, uniqueness: true

    validates :password, length: { in: 6..12 }

    validates :credit, numericality: true

    has_many :photos, class_name: 'SpreeeedEngine::FakePhoto', foreign_key: 'owner_id'
    accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

    has_one :avatar, -> { where(label: 'Avatar') }, class_name: 'SpreeeedEngine::FakePhoto', foreign_key: 'owner_id'
    accepts_nested_attributes_for :avatar, reject_if: :all_blank, allow_destroy: true


    # def self.editable_cols
    #   [:name, :email, :beginning_at]
    # end

    include AASM
    aasm :column => :published_state do
      state :draft, :initial => true
      state :published
      state :archived

      after_all_transitions :log_status_change

      event :publishing do
        transitions :from => [:draft, :archived], :to => :published #, :after => SpreeeedEngine::AasmRunTime
      end

      event :archiving do
        transitions :from => [:draft, :published], :to => :archived
      end
    end

    def log_status_change
      puts "#{name} changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
    end

  end

end

