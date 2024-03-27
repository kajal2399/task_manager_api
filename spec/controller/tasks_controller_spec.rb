require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:valid_attributes) { { title: 'Sample Task', description: 'This is a sample task.', status: 'To Do' } }
  let(:invalid_attributes) { { title: '', description: 'Invalid task.', status: 'To Do' } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      task = Task.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      task = Task.create! valid_attributes
      get :show, params: { id: task.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Task' do
        expect {
          post :create, params: { task: valid_attributes }, session: valid_session
        }.to change(Task, :count).by(1)
      end

      it 'renders a JSON response with the new task' do
        post :create, params: { task: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new task' do
        post :create, params: { task: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) { { title: 'Updated Task' } }

    context 'with valid params' do
      it 'updates the requested task' do
        task = Task.create! valid_attributes
        put :update, params: { id: task.to_param, task: new_attributes }, session: valid_session
        task.reload
        expect(task.title).to eq('Updated Task')
      end

      it 'renders a JSON response with the task' do
        task = Task.create! valid_attributes
        put :update, params: { id: task.to_param, task: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the task' do
        task = Task.create! valid_attributes
        put :update, params: { id: task.to_param, task: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      task = Task.create! valid_attributes
      expect {
        delete :destroy, params: { id: task.to_param }, session: valid_session
      }.to change(Task, :count).by(-1)
    end
  end
end
