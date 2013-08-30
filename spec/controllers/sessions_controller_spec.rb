require 'spec_helper'

describe SessionsController do
  describe 'POST #create' do
    before { request.env["omniauth.auth"] = omniauth_credentials }
    let(:omniauth_credentials) { {"provider" => "instagram", "uid" => "1234567", "info" => { "name" => "test-user"}} }
    
    context 'When ommiauth.auth is invalid' do
      let(:omniauth_credentials) { {provider: nil, uid: nil, :info['name'] => nil }}  
      it "should raise an error " do
        # request.env["omniauth"]["provider"] = nil   
        expect { post :create}.to raise_error
      end
    end
  end
end
