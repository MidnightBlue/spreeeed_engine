module SpreeeedEngine
  class FakePhoto < ApplicationRecord
    belongs_to :owner, class_name: 'SpreeeedEngine::FakeObject', foreign_key: 'owner_id'

    # validates :owner_id, presence: true

    mount_uploader :asset, FakePhotoUploader

    def self.editable_cols
      [:caption, :asset]
    end
  end
end