require 'rails_helper'

describe BeautyPlacePolicy do
  subject { BeautyPlacePolicy.new(user, beauty_place) }

  let(:resolved_scope) {
      BeautyPlacePolicy::Scope.new(user, BeautyPlace.all).resolve
    }

  context 'being a site visitor' do
    let(:user) { nil }
    let(:beauty_place) { create(:salon) }

    context 'creating a new beauty_place' do
      it 'should throw an error' do
        expect { BeautyPlacePolicy.new(user, beauty_place) }.to raise_error(Pundit::NotAuthorizedError, 'must be logged in')
        # it { should forbid_mass_assignment_of(:beauty_place) }
      end
    end

    context 'accessing an existing beauty_place' do
      it 'should throw a NotAuthorizedError' do
        expect { BeautyPlacePolicy.new(user, beauty_place) }.to raise_error(Pundit::NotAuthorizedError, 'must be logged in')
        # it { shuold forbid_mass_assignment_of(:beauty_place)}
      end
    end

  end

  context 'being a site administrator' do
    let(:user) { create(:user, :admin) }
    let(:beauty_place) { create(:salon) }

    context 'permits new and create actions' do
      it { should permit_new_and_create_actions }
      # it { should permit_mass_assignment_of(:beauty_place) }
    end

    context 'accessing an existing beauty_place' do
      it { should permit_action(:show) }
      it { should permit_edit_and_update_actions }
      it { should permit_action(:destroy) }
      # it { should permit_mass_assignment_of(:deal) }
    end
  end

  context 'being a site owner' do
    let(:owner) { create(:user, :owner) }

  end

  # permissions :show? do
  #   it 'denies access if user that is nil' do
  #     binding.pry
  #     expect(subject).not_to permit(user, beauty_place)
  #   end
  #
  #   it 'grants permission if user is admin' do
  #     expect(subject).to permit(admin, beauty_place)
  #   end
  #
  #   it 'grants permission if user is owner' do
  #     expect(subject).to permit(owner, beauty_place)
  #   end
  # end
  #
  #
  # permissions :show? do
  #   it "prevents other users from seeing your profile" do
  #     expect(subject).not_to permit(current_user, other_user)
  #   end
  #   it "allows you to see your own profile" do
  #     expect(subject).to permit(current_user, current_user)
  #   end
  #   it "allows an admin to see any profile" do
  #     expect(subject).to permit(admin)
  #   end
  # end
  #
  # permissions :update? do
  #   it "prevents updates if not an admin" do
  #     expect(subject).not_to permit(current_user)
  #   end
  #   it "allows an admin to make updates" do
  #     expect(subject).to permit(admin)
  #   end
  # end
  #
  # permissions :destroy? do
  #   it "prevents deleting yourself" do
  #     expect(subject).not_to permit(current_user, current_user)
  #   end
  #   it "allows an admin to delete any user" do
  #     expect(subject).to permit(admin, other_user)
  #   end
  # end
  #
end
