Clone this repository or copy the file to your project:
git clone https://github.com/kushwahdeepak/Bingo-played_deepak
cd Bingo-played_deepak
ruby -v
ruby Binog_played.rb


<!-- Decide Column Counts**   -->
   Initially, every column gets at least 1 number.  
   Then the remaining (15 - 9 = 6) numbers are randomly assigned to some columns (with a max of 3 numbers per column).

<!-- generate_columns**   -->
   Based on column counts, the program randomly selects unique numbers from each column's range using `sample(count).sort`.

<!-- **allocate_to_rows**   -->
   For each column, the chosen numbers are randomly assigned to different rows in the ticket.

<!-- finalize_rows**   -->
   Each row must have exactly 5 numbers:
   - If a row has **more than 5**, it randomly removes extras.
   - If a row has **fewer than 5**, it fills cells with leftover numbers from columns that still have unassigned numbers.

<!-- Display the Ticket**   -->
   The ticket (3 rows × 9 columns) is printed with proper formatting.