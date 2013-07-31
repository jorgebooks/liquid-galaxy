# vim:ts=4:sw=4:et:smartindent:nowrap

require 'rubygems'
require 'net/http'
require 'uri'
require 'cgi'
require 'json'

# Geocoder base class
class Geocoder
    attr_accessor :host, :path, :params
    def initialize
        @params = {}
    end

    def parse_response(r)
        raise "Unimplemented -- use a child of the Geocoder class"
    end
end

# Some specific geocoding API classes follow.  Google's would seem most
# obvious, but since it requires you to display results on a map, ... I didn't
# want to have to evaluate other possible restrictions, or require that they be
# imposed on Kamelopard users.

class MapquestGeocoder < Geocoder
    attr_reader :api_key, :response_format

    def initialize(key, response_format = 'json')
        super()
        @proto = 'http'
        @host = 'www.mapquestapi.com'
        @path = '/geocoding/v1/address'
        @api_key = key
        @response_format = response_format
        @params['key'] = @api_key
    end

    # Returns an object built from the JSON result of the lookup, or an exception
    def lookup(address)
        # The argument can be a string, in which case PlaceFinder does the parsing
        # The argument can also be a hash, with several possible keys. See the PlaceFinder documentation for details
        # http://developer.yahoo.com/geo/placefinder/guide/requests.html
        http = Net::HTTP.new(@host)
        if address.kind_of? Hash then
            p = @params.merge address
        else
            p = @params.merge( { 'location' => address } )
        end
        q = p.map { |k,v| "#{ k == 'key' ? k : CGI.escape(k) }=#{ k == 'key' ? v : CGI.escape(v) }" }.join('&')
        u = URI::HTTP.build([nil, @host, nil, @path, q, nil])

        resp = Net::HTTP.get u
        parse_response resp
    end

    def parse_response(r)
        d = JSON.parse(r)
        raise d['info']['messages'].join(', ') if d['info']['statuscode'] != 0
        d
    end
end

# Uses Yahoo's PlaceFinder geocoding service: http://developer.yahoo.com/geo/placefinder/guide/requests.html
# The argument to the constructor is a PlaceFinder API key, but
# testing suggests it's actually unnecessary
# NB! This is deprecated, as Yahoo's API is no longer free, and I'm not about to pay them to keep this tested.
# http://developer.yahoo.com/blogs/ydn/introducing-boss-geo-next-chapter-boss-53654.html
class YahooGeocoder < Geocoder
    def initialize(key)
        @api_key = key
        @proto = 'http'
        @host = 'where.yahooapis.com'
        @path = '/geocode'
        @params = { 'appid' => @api_key, 'flags' => 'J' }
    end

    # Returns an object built from the JSON result of the lookup, or an exception
    def lookup(address)
        # The argument can be a string, in which case PlaceFinder does the parsing
        # The argument can also be a hash, with several possible keys. See the PlaceFinder documentation for details
        # http://developer.yahoo.com/geo/placefinder/guide/requests.html
        http = Net::HTTP.new(@host)
        if address.kind_of? Hash then
            p = @params.merge address
        else
            p = @params.merge( { 'q' => address } )
        end
        q = p.map { |k,v| "#{ CGI.escape(k) }=#{ CGI.escape(v) }" }.join('&')
        u = URI::HTTP.build([nil, @host, nil, @path, q, nil])

        resp = Net::HTTP.get u
        parse_response resp
    end

    def parse_response(resp)
        d = JSON.parse(resp)
        raise d['ErrorMessage'] if d['Error'].to_i != 0
        d
    end
end

# EXAMPLE
# require 'rubygems'
# require 'kamelopard'
# g = YahooGeocoder.new('some-api-key')
# puts g.lookup({ 'city' => 'Springfield', 'count' => '100' })
