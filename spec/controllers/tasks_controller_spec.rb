require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'Authentication :' do
    it 'should have a current_user' do
      user = create(:user)
      sign_in user
      expect(subject.current_user).to_not eq(nil)
    end
  end

  describe 'GET #todo :' do
    it 'renders the :index view' do
      user = create(:user)
      sign_in user
      get :todo
      response.should render_template :index
    end

    it 'with signed user' do
      user = create(:user, email: 'todo@todo.com')
      sign_in user
      get :todo
      response.should be_success
    end

    it 'without signed user' do
      get :todo
      response.should_not be_success
    end

    it 'show only user tasks' do
      user = create(:user, email: 'tasks@todo.com')
      other_user = create(:user, email: 'other_tasks@todo.com')
      task = create(:task_todo, user: user)
      other_task = create(:task_todo, user: other_user)
      task.save!
      other_task.save!
      sign_in user
      get :todo
      assigns(:tasks).should eq([task])
    end
  end

  describe 'GET #done :' do
    it 'renders the :index view' do
      user = create(:user)
      sign_in user
      get :done
      response.should render_template :index
    end

    it 'with signed user' do
      user = create(:user, email: 'done@done.com')
      sign_in user
      get :done
      response.should be_success
    end

    it 'without signed user' do
      get :done
      response.should_not be_success
    end

    it 'show only user tasks' do
      user = create(:user, email: 'tasks@done.com')
      other_user = create(:user, email: 'other_tasks@done.com')
      task = create(:task_done, user: user)
      other_task = create(:task_done, user: other_user)
      task.save!
      other_task.save!
      sign_in user
      get :done
      assigns(:tasks).should eq([task])
    end
  end

  describe 'POST #create :' do
    it 'creates a new task' do
      expect do
        post :create, task: create(:task_todo)
      end.to change(Task, :count).by(1)
    end
  end
end
