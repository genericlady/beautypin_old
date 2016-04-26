require 'rails_helper'

describe BeautyPlacePolicy do
  subject { BeautyPlacePolicy }

  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:other_user) { FactoryGirl.build_stubbed :user }
  let (:owner) { FactoryGirl.build_stubbed :user, :owner }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }
  let (:salon) { build_stubbed :beauty_place }

  before :each do
    salon.owner = owner
  end

  permissions :index? do
    it "allows access if not an admin" do
      binding.pry
      expect(BeautyPlacePolicy).to permit(current_user)
    end

    it "allows access for an admin" do
      expect(BeautyPlacePolicy).to permit(admin)
    end

    it "allows access for an owner" do
      expect(BeautyPlacePolicy).to permit(owner)
    end

  end
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
