require ('pg')
require_relative('../db/sql_runner')
require ('pry-byebug')

class Accessory

  attr_reader(:id, :type, :brand, :cost, :quantity, :cost_price)

  def initialize (params)
    @id = params['id'].to_i
    @brand = params['brand']
    @type = params['type']
    @cost = params['cost'].to_i
    @quantity = params['quantity'].to_i
    @cost_price = params['cost_price'].to_f
  end

    def save()
      sql = "INSERT INTO accessories (brand, type, cost, quantity, cost_price) VALUES ('#{@brand}', '#{@type}', #{@cost}, #{@quantity}, #{@cost_price}) RETURNING *;"
      accessories = SqlRunner.run(sql).first
      @id = accessories['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM accessories;"
      return Accessory.map_items(sql)
    end

    def self.find(id)
      sql = "SELECT * FROM accessories WHERE id =#{id};"
      return Accessory.map_item(sql)
    end
    
    def update(params)
        sql = (  
          "UPDATE accessories SET 
            brand='#{params['brand']}',
            type='#{params['type']}',
            cost=#{params['cost']},
            quantity=#{params['quantity']},
            cost_price=#{params['cost_price']}
            WHERE id=#{params['id']} RETURNING *;"
        ) 
        SqlRunner.run(sql)
    end

    def self.map_items(sql)
      accessories = SqlRunner.run(sql)
      result = accessories.map {|i| Accessory.new(i)}
      return result
    end

    def self.map_item(sql)
      result = Accessory.map_items(sql)
      return result.first
    end

    def self.delete_all()
      sql = "DELETE FROM accessories;"
      SqlRunner.run(sql)
    end

    def self.delete(id)
      sql = "DELETE FROM accessories WHERE id =#{id};"
      SqlRunner.run(sql)
    end

    def self.stock_quantity_accessories()
      sql = "SELECT SUM(quantity) FROM accessories;"
      result = SqlRunner.run(sql)
      return result.first['sum'].to_i
    end

    def self.stock_count_accessories()
      sql = "SELECT COUNT (*) FROM accessories;"
      result = SqlRunner.run(sql)
      return result.first['count'].to_i
    end

    def self.total_accessories_assets()
      sql = "SELECT SUM(cost) FROM accessories;"
      result = SqlRunner.run(sql)
      return result.first['sum'].to_i
    end

    def self.accessories_markup()
      sql = "SELECT SUM(cost_price) FROM accessories;"
      result = SqlRunner.run(sql)
      return result.first['sum'].to_f
    end

    def self.stock_level_accessories()
      number = self.stock_count_accessories
      case number
      when (0..10)
        return ("LOW")
      when (11..25)
        return ("MEDIUM")
      when (26..35)
        return ("HIGH")
      else
        return ("FULL")
      end
    end

    def self.accessory_stock_level()
      number = self.stock_quantity_accessories
      case number
      when (0..50)
        return ("LOW")
      when (51..150)
        return ("MEDIUM")
      when (151..250)
        return ("HIGH")
      else
        return ("FULL")
      end
    end

    def accessory_quantity()
      number = @quantity
      case number
      when (0..5)
        return ("LOW")
      when (6..10)
        return ("MEDIUM")
      when (11..20)
        return ("HIGH")
      else 
        return ("FULL")
      end
    end
end
