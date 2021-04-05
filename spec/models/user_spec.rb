# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birthday               :date             not null
#  email                  :string(191)      default(""), not null
#  encrypted_password     :string(191)      default(""), not null
#  image                  :string(191)
#  job                    :string(191)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(191)
#  skill                  :string(191)      not null
#  username               :string(191)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, email, and password" do
    user = User.new(
      name: "user1",
      email: "sample@example.com",
      password: "8282",
      skill: "主体性",
      job: "建設機械",
    )
    expect(user). to be_valid
  end
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:user]). to include('can`t be blank')
  end
  it "is invalid without email address" do
  user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]). to include('can`t be blank')
  end
  it "is invalid without password"
end
