
module PodcastSyncerModel
  class Repository < SimpleDelegator
    def initialize(model)
      __setobj__(const_get(model.to_s).new)
    end
  end
end
require 'podcast_syncer_model/repository/account'
