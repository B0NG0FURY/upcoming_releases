require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative "./upcoming_releases/version"
require_relative "./upcoming_releases/cli"
require_relative "./upcoming_releases/scraper"
require_relative "./upcoming_releases/album"

module UpcomingReleases
  class Error < StandardError; end
  # Your code goes here...
end
