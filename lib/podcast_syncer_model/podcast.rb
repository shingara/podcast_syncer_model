require 'mongoid'

module PodcastSyncerModel
  class Podcast
    include Mongoid::Document

    field :url, :type => String
  end
end
