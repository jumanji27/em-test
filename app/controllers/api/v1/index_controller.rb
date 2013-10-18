module Api
  module V1
    class IndexController < ApplicationController

      def sale
        sale = PropertyMarker.where marker_type: 'sale'
        render json: sale
      end

      def rent
        rent = PropertyMarker.where marker_type: 'rent'
        render json: rent
      end

      def development
        development = DevelopmentMarker.all
        render json: development
      end

    end
  end
end
