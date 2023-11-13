require 'rails_helper'

describe User do
  
  before { User.new({first_name: 'chacha', last_name: "martineau", email: 'fanny@mail.fr' }).save }
  describe 'validation' do
    it {expect( User.new({first_name: 'chacha', last_name: "martineau", email: 'chacha@mail.fr' }).save).to be true}
    it {expect( User.new({first_name: 'chacha', last_name: "martineau", email: nil }).save).to be true}
    it {expect( User.new({first_name: nil, last_name: "martineau", email: 'chacha@mail.fr' }).save).to be false}
    it {expect( User.new({first_name: 'chacha', last_name: nil, email: 'chacha@mail.fr' }).save).to be false}
    it {expect( User.new({first_name: 'chacha', last_name: "martineau", email: 'chachamail.fr' }).save).to be false}
    it {expect( User.new({first_name: 'chacha', last_name: "martineau", email: 'fanny@mail.fr' }).save).to be false}
  end

end