require 'spec_helper'

Mongoid.load!(
  File.join(File.dirname(__FILE__), 'mongoid.yml'),
  'test'
)

require 'podcast_syncer_model'
