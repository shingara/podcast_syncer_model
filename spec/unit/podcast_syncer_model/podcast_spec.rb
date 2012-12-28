require 'spec_helper'
require_relative '../../../lib/podcast_syncer_model/podcast'

describe PodcastSyncerModel::Podcast do

  it { should have_field(:url).of_type(String) }
  it { should embed_many(:items).of_type(PodcastSyncerModel::Item) }
  its(:collection_name) { should eq :podcasts }

end
