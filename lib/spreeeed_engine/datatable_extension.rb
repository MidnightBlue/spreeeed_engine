module DatatableExtension
  extend ActiveSupport::Concern


  class_methods do
    def datatable_id
      "#{self.name.demodulize.underscore}_datatable"
    end

    def datatable_cols
      displayable_attrs
    end

    def datatable_sortable_cols
      displayable_attrs
    end

    def datatable_default_sortable_cols
      [[:id, :DESC]]
    end

    def datatable_searchable_cols
      displayable_attrs.select do |attr|
        %w(string integer float decimal datetime date time).include?(columns_hash[attr.to_s].type.to_s)
      end
    end
  end

end

# include the extension
ActiveRecord::Base.send(:include, DatatableExtension)
