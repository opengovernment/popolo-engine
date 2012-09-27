require_dependency 'popolo/application_controller'

module Popolo
  class DivisionsController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def show
      @division = Division.find_by_slug(params[:id])
      show!
    end
  end
end