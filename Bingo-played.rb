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
    allocate_extra_numbers
    @columns = generate_columns
    @ticket = Array.new(3) { Array.new(9, 'X') }
    allocate_to_rows
    finalize_rows
  end

#  Picks actual numbers for each column with unique numbers
  def generate_columns
    @column_counts.map.with_index do |count, i|
      COLUMN_RANGES[i].sample(count).sort
    end
  end

  def allocate_extra_numbers
    remaining = 15 - @column_counts.sum
    while remaining.positive?
      index = rand(9)
      if @column_counts[index] < 3
        @column_counts[index] += 1
        remaining -= 1
      end
    end
  end

  def allocate_to_rows
    @columns.each_with_index do |numbers, col|
      rows = (0..2).to_a.sample(numbers.size)
      numbers.each_with_index do |num, i|
        @ticket[rows[i]][col] = num
      end
    end
  end

#  assigning numbers
  def finalize_rows
    @ticket.each_with_index do |row, idx|
        trim_row(row)
        fill_row(row, idx)
      end
  end
end
