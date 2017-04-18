require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test
  def test_object_is_a_pantry
    p = Pantry.new

    assert_instance_of Pantry, p
  end

  def test_pantry_stock_is_initialized_empty
    p = Pantry.new

    assert p.stock.empty?
  end

  def test_pantry_stock_is_initialized_a_hash
    p = Pantry.new

    assert p.stock.is_a?(Hash)
  end

  def test_pantry_stock_can_be_checked
    p = Pantry.new

    assert_equal 0, p.stock_check("Cheese")
  end

  def test_pantry_can_be_restocked 
    p = Pantry.new
    assert_equal 0, p.stock_check("Cheese")

    p.restock("Cheese", 10)
    assert_equal 10, p.stock_check("Cheese")
    
    p.restock("Cheese", 20)
    assert_equal 30, p.stock_check("Cheese")
  end

  def test_recipe_is_accessible
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    
    expected = {"Cheese" => 20, "Flour" => 20}
    actual = r.ingredients

    assert_equal expected, actual
  end

  def test_pantry_can_add_shopping_list_based_on_recipe
    p = Pantry.new

    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    p.add_to_shopping_list(r)
    actual = p.shopping_list
    expected = {"Cheese" => 20, "Flour" => 20}
    assert_equal expected, actual
  end

  def pantry_can_add_list_for_multiple_recipes
    p = Pantry.new

    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    p.add_to_shopping_list(r)
    actual = p.shopping_list
    expected = {"Cheese" => 20, "Flour" => 20}
    assert_equal expected, actual

    another_r = Recipe.new("Spaghetti")
    another_r.add_ingredient("Noodles", 10)
    another_r.add_ingredient("Sauce", 10)
    another_r.add_ingredient("Cheese", 5)
    
    p.add_to_shopping_list(another_r)

    actual = p.shopping_list
    expected = {"Cheese" => 25, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}

    assert_equal expected, actual
  end

  def test_list_can_be_printed
    p = Pantry.new

    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    p.add_to_shopping_list(r)
    actual = p.shopping_list
    expected = {"Cheese" => 20, "Flour" => 20}
    assert_equal expected, actual

    another_r = Recipe.new("Spaghetti")
    another_r.add_ingredient("Noodles", 10)
    another_r.add_ingredient("Sauce", 10)
    another_r.add_ingredient("Cheese", 5)
    
    p.add_to_shopping_list(another_r)

    p.print_shopping_list
    #manually verify output on terminal screen
  end    

end
