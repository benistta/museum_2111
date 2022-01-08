class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      # require "pry"; binding.pry
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def have_interest(exhibit)
    @patrons.find_all do |patron|
      patron.interests.include?(exhibit.name)
    end
  end

  def patrons_by_exhibit_interest
    result = {}
     @exhibits.each do |exhibit|
       # if result[exhibit].nil?
        result[exhibit] = have_interest(exhibit)
      # end
     end
     result
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
    patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).map do |contestant|
      contestant.name
    end.sample
  end
end
