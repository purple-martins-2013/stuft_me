require 'spec_helper'

describe Drool do
  it { should belong_to(:user) }
  it { should belong_to(:plate) }
end
