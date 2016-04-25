require 'rails_helper'

xdescribe 'BeautyPlacesController' do

  context 'POST create' do
    it 'creates a beauty place' do
      post :create, beauty_place: create(:salon)
      expect(response).to redirect_to(projects_path)
      expect(assigns(:action).beauty_place.name).to eq('Salon Sassoon')
    end
  end

  context 'GET show' do
    it 'shows a beauty_place' do
      beauty_place = create(:salon)
      get :show, { id: beauty_place.id.to_s }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response).to eq('Salon Sassoon')
    end

    # it "allows a user who is part of the project to see the project" do
      # controller.current_user.stubs(can_view?: true)
      # get :show, id: project.id
      # expect(response).to render_template(:show)
    # end

    # it "does not allow a user who is not part of the project to see the project" do
      # controller.current_user.stubs(can_view?: false)
      # get :show, id: project.id
      # expect(response).to redirect_to(new_user_session_path)
    # end
  end

  context 'GET index' do
    it "is a successful index request with no filters" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

end
