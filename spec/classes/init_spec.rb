require 'spec_helper'
describe 'dist_certs' do

  context 'with defaults for all parameters' do
    it { should contain_class('dist_certs') }
  end
end
