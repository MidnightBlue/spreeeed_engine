module SpreeeedEngine
  class FakePhotosController < SpreeeedEngine::ApplicationController

    include EngineRouteController

    def set_klass
      @klass = SpreeeedEngine::FakePhoto
    end

    def set_datatables_config
      @datatable_config                                     = {}
      @datatable_config[@klass_key]                         = {}
      @datatable_config[@klass_key][:cols]                  = [:owner, :caption, :asset, :content_type, :width, :height, :size]
      @datatable_config[@klass_key][:searchable_cols]       = [:content_type]
      @datatable_config[@klass_key][:default_sortable_cols] =  [[:content_type, 'ASC']]
    end

  end
end