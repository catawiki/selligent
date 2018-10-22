require 'spec_helper'
require 'ostruct'

RSpec.describe Selligent::Authorizer do
  let(:config) { OpenStruct.new(username: 'catawiki', api_key: 'secret') }
  let(:env) { { method: 'get', url: 'http://selligent.com' } }

  subject(:authorizer) { described_class.new(config) }

  # rubocop:disable Metrics/LineLength
  describe '.auth_header' do
    before do
      Timecop.freeze(Time.new(2018, 10, 19))
    end

    it 'generates the authorization header' do
      expected = 'hmac catawiki:9a454c90db8ec24825a02bd2c40c5c0e22681612442ec1e2dc93510e0ceb8496:1539900000'
      expect(authorizer.auth_header(env)).to eq(expected)
    end
  end
  # rubocop:enable Metrics/LineLength
end