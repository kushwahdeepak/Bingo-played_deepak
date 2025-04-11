class HousieTicket
    # Here Defines number ranges for each of the 9 columns
    COLUMN_RANGES = [
    (1..9).to_a,
    (10..19).to_a,
    (20..29).to_a,
    (30..39).to_a,
    (40..49).to_a,
    (50..59).to_a,
    (60..69).to_a,
    (70..79).to_a,
    (80..90).to_a
  ].freeze

  # Generates a 3x9 ticket by initializing columns
  def initialize
    @column_counts = Array.new(9, 1)
    @columns = generate_columns
    @ticket = Array.new(3) { Array.new(9, 'X') }
  end

  def generate_columns
    @column_counts.map.with_index do |count, i|
      COLUMN_RANGES[i].sample(count).sort
    end
  end

end
