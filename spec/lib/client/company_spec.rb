require 'spec_helper'
require_relative '../../../lib/fedger_api/client'


describe FedgerAPI::Client, vcr: true do
  fedger_api_config = YAML::load_file(File.join(__dir__, '../../../fedger_api.yml'))

  let(:client) { FedgerAPI::Client.new(fedger_api_config['api_key']) }

  context FedgerAPI::Client::Company do
    context '#funding_details' do
      subject { client.funding_details(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:name, :domain, :amount_total, :rounds) }
    end

    context '#funding_status' do
      subject { client.funding_status(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:name, :domain, :amount_total) }
    end

    context '#fundings' do
      subject { client.fundings(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
    end

    context '#company_insights' do
      subject { client.company_insights(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:cursor, :nodes) }
    end

    context '#investors' do
      subject { client.investors(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:name, :domain, :investors) }
    end

    context '#locations' do
      subject { client.locations(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:name) }
    end

    context '#peers' do
      subject { client.peers(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:peers) }
    end

    context '#portfolio_companies' do
      subject { client.portfolio_companies(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:domain, :name, :portfolio) }
    end

    context '#company_snapshot' do
      subject { client.company_snapshot(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:fundingLevel, :dateFounded, :name, :slug) }
    end

    context '#team_details' do
      subject { client.team_details(fedger_api_config['test_company']) }

      it { should be_an FedgerAPI::Response }
      it { should respond_to(:domain, :name, :team) }
    end
  end
end


