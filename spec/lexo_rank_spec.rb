require File.expand_path('../spec_helper', __FILE__)

RSpec.describe LexoRank, type: :service do
  describe 'lexorank' do
    it 'default' do
      expect(LexoRank.get_rank).to match('U')
      expect(LexoRank.get_rank('', 'U')).to be < 'U'
      expect(LexoRank.get_rank('U')).to be > 'U'
    end
  end
end