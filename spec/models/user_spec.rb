require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do
  it { should have_valid(:first_name).when('John', 'Sally')}
  it { should_not have_valid(:first_name).when(nil, '')}

  it { should have_valid(:last_name).when('Smith', 'Shickelgruber')}
  it { should_not have_valid(:last_name).when(nil, '')}

  it { should have_valid(:email).when('email@email.com', 'mustache@gmail.com')}
  it { should_not have_valid(:email).when(nil, '', 'user', 'user.com')}

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
