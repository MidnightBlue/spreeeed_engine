module SpreeeedEngine
  class FakeObjectsController < SpreeeedEngine::ApplicationController

    include EngineRouteController

    def set_klass
      @klass = SpreeeedEngine::FakeObject
    end

    def set_datatables_config
      @datatable_config                                     = {}
      @datatable_config[@klass_key]                         = {}
      @datatable_config[@klass_key][:cols]                  = [:name, :email, :credit, :beginning_at, :published_state, :commentable]
      @datatable_config[@klass_key][:searchable_cols]       = [:name]
      @datatable_config[@klass_key][:default_sortable_cols] = [[:name, 'ASC']]
    end


  end
end