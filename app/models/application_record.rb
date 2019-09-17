class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # この記述がないとNameError: uninitialized constant DataTest::CSVになる
  require 'csv'
end
