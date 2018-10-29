require "rails_helper"

describe GeocoderController do
  let(:user){ FactoryBot.create(:user) }

  describe "GET index" do
    subject{ get :index }

    context 'when user is not signed in' do
      it 'redirect to sign in' do
        subject.should redirect_to new_user_session_url
      end
    end

    context 'user is signed in' do
      it 'render template' do
        sign_in user
        subject.should render_template "index"
      end
    end
  end


  describe 'GET geocode' do
    context 'whatever the input is' do
      before do
        sign_in user
      end

      it 'should always render geocode template' do
        get :geocode, params: {location_string: "123"}
        expect(response.content_type).to eq "text/html"
        response.should render_template "geocode"
      end
    end
  end
end
