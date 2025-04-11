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

  def print
    puts 'Generated Housie Ticket:'
    @ticket.each do |row|
      puts row.map { |cell| cell.to_s.rjust(2, ' ') }.join(' | ')
    end
  end

  private
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
# removes numbers until there are only 5 in the row
  def trim_row(row)
    while row.count { |cell| cell != 'X' } > 5
      col = rand(9)
      row[col] = 'X' unless row[col] == 'X'
    end
  end
# adds missing numbers (if fewer than 5)
  def fill_row(row, row_index)
    while row.count { |cell| cell != 'X' } < 5
      col = rand(9)
      next if row[col] != 'X' || @columns[col].empty?

      value = @columns[col].pop
      row[col] = value
    end
  end

end

ticket = HousieTicket.new
ticket.print


# Each ticket shows exactly 15 numbers, 
# ticket every number from 1 to 90 is used exactly once.
# A ticket is a grid of 3 rows by 9 columns. 
# The first column contains numbers from 1 to 9; 
# the second column numbers from 10 to 19; the third 20 to 29 and so on up until the last column, which contains numbers from 80 to 90.
# Each column contains one, two or three numbers, in increasing order downwards. Each row contains exactly 5 numbers (and hence 4 blanks)
