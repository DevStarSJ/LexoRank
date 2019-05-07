require File.expand_path('../spec_helper', __FILE__)

RSpec.describe LexoRank, type: :service do
  describe 'lexorank' do
    it 'default' do
      LexoRank.get_rank().should == 'U'
      LexoRank.get_rank('', 'U').should < 'U'
      LexoRank.get_rank('U', '').should > 'U'
    end
  end
end