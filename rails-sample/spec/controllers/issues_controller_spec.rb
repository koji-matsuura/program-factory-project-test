require 'rails_helper'

describe IssuesController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    
    context 'with valid params' do
      it 'creates a new issue' do
        expect {
          post :create, params: {
            issue: { title: 'Test Issue', description: 'Description', user_id: user.id, status: 'open' }
          }
        }.to change(Issue, :count).by(1)
      end
      
      it 'returns status 201' do
        post :create, params: {
          issue: { title: 'Test Issue', description: 'Description', user_id: user.id, status: 'open' }
        }
        expect(response.status).to eq(201)
      end
    end
  end
end
