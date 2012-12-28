require 'spec_helper'
require_relative '../../../lib/podcast_syncer_model/item'

describe PodcastSyncerModel::Item do

  it { should have_field(:link).of_type(String) }
  it { should have_field(:title).of_type(String) }
  it { should have_field(:published_at).of_type(DateTime) }
  it { should have_field(:author).of_type(String) }
  it { should have_field(:description).of_type(String) }
  it { should have_field(:guid).of_type(String) }


  it { should be_embedded_in(:podcasts).of_type(PodcastSyncerModel::Podcast) }

end
