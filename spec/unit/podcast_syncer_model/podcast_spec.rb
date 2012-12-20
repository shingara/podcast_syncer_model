require 'spec_helper'
require_relative '../../../lib/podcast_syncer_model/podcast'

describe PodcastSyncerModel::Podcast do

  it { should have_field(:url).of_type(String) }

end
