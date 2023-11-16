module DeviseMethods
  extend ActiveSupport::Concern

  included do
    def will_save_change_to_email?
      false
    end

    def email_required?
      false
    end

    def email_changed?
      false
    end
  end
end
