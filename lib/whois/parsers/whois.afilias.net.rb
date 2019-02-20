#--
# Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
#
# Copyright (c) 2009-2018 Simone Carletti <weppos@weppos.net>
#++


require_relative 'base_afilias2'


module Whois
  class Parsers

    # Parser for the whois.afilias.net server.
    class WhoisAfiliasNet < BaseAfilias2

      self.scanner = Scanners::BaseAfilias, {
          pattern_disclaimer: /^Access to|^The Registrar of/,
          pattern_reserved: /^(Name is reserved by afilias\n)|(Reserved by Registry\n)/,
      }


      property_supported :status do
        if reserved?
          :reserved
        else
          super()
        end
      end

      # NEWPROPERTY
      def reserved?
        !!node("status:reserved")
      end

    end

  end
end
