require 'spec_helper'
require 'fileutils'

describe 'Spine::Rails::Source' do

  before :all do
    d = Rails.root.join('tmp','cache','assets')
    FileUtils.rm_r d if Dir.exists? d
  end

  it 'should be served' do
    assets.should serve 'application.js'
  end

  it "should include Spine version #{Spine::Rails::SPINE_VERSION}" do
    asset_for('application.js').source.should include "Spine.version = '#{Spine::Rails::SPINE_VERSION}'"
  end

  it 'should include Spine.Controller' do
    asset_for('application.js').source.should include "Spine.Controller = Controller"
  end

  it 'should include Spine.Model' do
    asset_for('application.js').source.should include "Spine.Model = Model"
  end

  it 'should include Spine.Manager' do
    asset_for('application.js').source.should include "Spine.Manager"
  end

  it 'should include Spine.Ajax' do
    asset_for('application.js').source.should include "Spine.Ajax = Ajax;"
  end

  it 'should include Spine.Route' do
    asset_for('application.js').source.should include "Spine.Route"
  end

end