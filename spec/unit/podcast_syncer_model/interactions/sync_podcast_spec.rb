require 'spec_helper'
require_relative '../../../../lib/podcast_syncer_model/interactions/sync_podcast'

describe PodcastSyncerModel::Interactions::SyncPodcast do
  let(:podcast_entry_1) {
    PodcastReader::ItemNode.new(
      :title=> 'foo',
      :link=> 'http://example.org/foo',
      :comments=> 'comment on foo',
      :published_at=> DateTime.current ,
      :author=> 'Cyril',
      :categories=> 'ruby',
      :guid=> 'http://example.org/foo',
      :description=> 'description of foo',
    )
  }

  let(:podcast_entry_2) {
    PodcastReader::ItemNode.new(
      :title=> 'bar',
      :link=> 'http://example.org/bar',
      :comments=> 'comment on bar',
      :published_at=> DateTime.current ,
      :author=> 'Cyril',
      :categories=> 'ruby',
      :guid=> 'http://example.org/bar',
      :description=> 'description of bar',
    )
  }

  let(:podcast) {
    PodcastSyncerModel::Podcast.new(:url => 'http://feeds.feedburner.com/RubyRogues')
  }

  describe "#sync" do
    before do
      PodcastReader.expects(:new).with('http://feeds.feedburner.com/RubyRogues').returns([
        podcast_entry_1, podcast_entry_2
      ])
      podcast.expects(:save).returns(true)
    end
    let(:sync) {
      PodcastSyncerModel::Interactions::SyncPodcast.new(podcast).sync
    }
    it 'save podcast' do
      sync.should eq podcast
    end


    it 'add entries in podcast' do
      sync.items.should have(2).items
    end

    it 'fill good entries to podcast' do
      sync.items.first.link.should eq podcast_entry_1.link
      sync.items.first.title.should eq podcast_entry_1.title
      sync.items.first.guid.should eq podcast_entry_1.guid
      sync.items.first.published_at.should eq podcast_entry_1.published_at
      sync.items.first.author.should eq podcast_entry_1.author
      sync.items.first.description.should eq podcast_entry_1.description
    end

  end
end
