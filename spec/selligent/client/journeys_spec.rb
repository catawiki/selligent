require 'spec_helper'

RSpec.describe Selligent::Client::Status do
  include_context 'base_client'

  subject(:client) { base_client.extend(described_class) }

  let(:base_url) { '/Status' }

  describe '.journeys' do
    it 'calls the correct endpoint' do
      client.status

      expect(client).to have_received(:get).with(base_url)
    end
  end
end
