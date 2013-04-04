require 'test_helper'

describe HyperResource::Link do
  before do
    @link = HyperResource::Link.new(nil, {'href' => '/foo{?blarg}',
                                          'templated' => true})
  end

  describe '#where' do
    it 'where does not mutate original link' do
      link2 = @link.where('blarg' => 22)
      @link.params['blarg'].must_be_nil
      link2.params['blarg'].must_equal 22
    end
  end

  describe '#href' do
    it 'href fills in URI template params' do
      link2 = @link.where('blarg' => 22)
      link2.href.must_equal '/foo?blarg=22'
    end
  end
end
