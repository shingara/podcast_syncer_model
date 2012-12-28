require 'podcast_reader'
module PodcastSyncerModel::Interactions
  class SyncPodcast
    def initialize(podcast)
      @podcast = podcast
    end
    attr_reader :podcast

    def sync
      PodcastReader.new(podcast.url).entries.each do |entry|
        podcast.items.build(entry.attributes)
      end
      podcast.save
      podcast
    end
  end
end
