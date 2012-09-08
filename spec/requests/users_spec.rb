require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  
  describe "needs a name" do
    before { @user.name = "" }
    it { should_not be_valid }
  end
  describe "needs a name not too long" do
    before { @user.name = "a"*51 }
    it { should_not be_valid }
  end
  describe "needs an email" do
    before { @user.email = "" }
    it { should_not be_valid }
  end
  describe "the email format should be valid" do
    it "should not be valid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |ad|
        @user.email = ad
        @user.should_not be_valid
      end
    end
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |ad|
        @user.email = ad
        @user.should be_valid
      end
    end
  end
  describe "the email should be unique" do
    before do
      user_rep = @user.dup
      user_rep.save
    end
    it { should_not be_valid }
  end
end