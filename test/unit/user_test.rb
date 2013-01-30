require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
	 user = User.new
	 assert !user.save
	 assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
	 user = User.new
	 user.profile_name = 'az1987'
	 user.email = "pateaaron@hotmail.co.uk"
	 user.first_name = "Aaron"
	 user.last_name = "Pate"
	 user.password = "password1"
	 user.password_confirmation = "password1"
	 assert !user.save
	 assert !user.errors[:profile_name].empty?
  end

  test "a  user shoudl have a profile name without spaces" do
    user = User.new
    user.profile_name = "My profile with spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert !user.errors[:profile_name].include?("Must be formatted correctly")
  end

end
