require 'test_helper'

class ConceptTest < ActiveSupport::TestCase
  test "that a concept requires content" do
  	concept = Concept.new
  	assert !concept.save
  	assert !concept.errors[:title].empty?
  	assert !concept.errors[:description].empty?
  	assert !concept.errors[:body].empty?
  end

  test "that a concept has a user id" do
  	concept = Concept.new
  	concept.title = 'Hello'
  	concept.description = 'Hello'
  	concept.body = 'Hello'
  	assert !concept.save
  	assert !concept.errors[:user_id].empty?
  end
end
