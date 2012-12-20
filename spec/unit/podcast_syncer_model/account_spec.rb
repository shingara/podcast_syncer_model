require 'spec_helper'
require_relative '../../../lib/podcast_syncer_model/account'

describe PodcastSyncerModel::Account do
  it { should have_field(:_id) }
  its(:collection_name) { should eq :accounts }
end
