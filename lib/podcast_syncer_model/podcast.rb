require 'mongoid'

module PodcastSyncerModel
  class Podcast
    include Mongoid::Document
    store_in :collection => 'podcasts'

    field :url, :type => String
  end
end
