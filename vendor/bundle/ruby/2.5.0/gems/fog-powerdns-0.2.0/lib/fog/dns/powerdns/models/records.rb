# frozen_string_literal: true

require 'fog/core/collection'

module Fog
  module DNS
    class PowerDNS
      class Records < Fog::Collection
        attribute :zone
        model Fog::DNS::PowerDNS::Record

        def all
          requires :zone
          clear
          data = service.get_zone(zone)[:records]
          load(data)
        end
      end
    end
  end
end
