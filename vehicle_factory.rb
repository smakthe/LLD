require "./vehicle.rb"

class CarFactory
  DEFAULTS = {
    sedan: {
      name: "Camry",
      colour: "White",
      fuel_type: "Diesel",
      top_speed: 180,
      wheels: 4,
      max_passenger: 5,
      brand: "Toyota",
      make: "Sedan"
    },
    suv: {
      name: "Explorer",
      colour: "Black",
      fuel_type: "Petrol",
      top_speed: 200,
      wheels: 4,
      max_passenger: 7,
      brand: "Ford",
      make: "SUV"
    },
    ev: {
      name: "Model S",
      colour: "Red",
      fuel_type: "Electric",
      top_speed: 250,
      wheels: 4,
      max_passenger: 5,
      brand: "Tesla",
      make: "Sedan"
    }
  }

  def self.create_sedan
    create_car(DEFAULTS[:sedan])
  end

  def self.create_suv
    create_car(DEFAULTS[:suv])
  end

  def self.create_ev
    create_car(DEFAULTS[:ev])
  end

  private

  def self.create_car(config)
    Car.new(
      config[:name],
      config[:colour],
      config[:fuel_type],
      config[:top_speed],
      config[:wheels],
      config[:max_passenger],
      config[:brand],
      config[:make]
    )
  end
end

class BusFactory
  DEFAULTS = {
    ksrtc: {
      name: "Airavat",
      colour: "White",
      fuel_type: "Petrol",
      top_speed: 120,
      wheels: 8,
      max_passenger: 120,
      axles: 4,
      corporation: "Karnataka State Road Transport Corporation"
    },
    wbstc: {
      name: "Royal Cruiser",
      colour: "Blue",
      fuel_type: "Petrol",
      top_speed: 150,
      wheels: 8,
      max_passenger: 200,
      axles: 6,
      corporation: "West Bengal State Transport Corporation"
    }
  }

  def self.create_ksrtc_bus
    create_bus(DEFAULTS[:ksrtc])
  end

  def self.create_wbstc_bus
    create_bus(DEFAULTS[:wbstc])
  end

  private

  def self.create_bus(config)
    Bus.new(
      config[:name],
      config[:colour],
      config[:fuel_type],
      config[:top_speed],
      config[:wheels],
      config[:max_passenger],
      config[:axles],
      config[:corporation]
    )
  end
end

[:create_sedan, :create_suv, :create_ev].each{ |method| p CarFactory.send(method).details }
[:create_ksrtc_bus, :create_wbstc_bus].each{ |method| p BusFactory.send(method).details }