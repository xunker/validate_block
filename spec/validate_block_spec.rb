require File.dirname(__FILE__) + '/spec_helper.rb'

class Person < ActiveRecord::Base 

  HAIR_COLORS = %w{blond brown black}

  def bald?
    hair.nil?
  end

  validate_block :unless => :bald? do
    presence_of  :hair
    length_of    :hair, :within => 3..15
    inclusion_of :hair_color, :in => HAIR_COLORS
  end

end
describe "validate_block" do

  before(:each) do
    @person = Person.new
  end

   it "returns true" do
     @person.save.should == true #:nohair:
   end

   it "returns an error for long hair" do
     @person.hair = "a lot of effin hair mannnnn"
     @person.save.should == false
   end

   it "returns an error for red hair" do

     @person.hair = "short"
     @person.hair_color = "red"
     @person.save.should == false
   end

end
