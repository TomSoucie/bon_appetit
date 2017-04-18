require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def test_object_is_a_pantry
    p = Pantry.new

    assert_instance_of Pantry, p
  end

  def test_pantry_stock_is_initailized_empty
    p = Pantry.new

    assert p.stock.empty?
  end

  def test_pantry_stock_is_initialized_a_hash
    p = Pantry.new

    assert p.stock.is_a?(Hash)
  end
end
