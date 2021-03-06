class Image 
  def initialize(image_data)
    @image_data = image_data
  end

  def get_ones
    coords = []
    @image_data.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        coords << [row_index, col_index] if col == 1
      end
    end
    return coords
  end
  
  def blur_image
    coords = self.get_ones
    complex_copy = Marshal.load(Marshal.dump(@image_data))
    coords.each do |row, col|
      complex_copy[row][col - 1] = 1 if col != 0
      complex_copy[row][col + 1] = 1 if col != complex_copy[0].length - 1
      complex_copy[row - 1][col] = 1 if row != 0
      complex_copy[row + 1][col] = 1 if row != complex_copy.length - 1
    end
    complex_copy.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_original_image
    @image_data.each { |arr| puts arr.join }
    puts "\n"
  end

  def output_original_and_blurred_image
    self.output_original_image
    puts "Blurred Image:"
    self.get_ones
    self.blur_image
    puts "------------"
  end

end

# Make this cases work
one_px_transform = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

two_px_transform = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

px_edge_transform = Image.new([
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 1]
])

test = Image.new([
  [0]
])

# puts "Original 1px Transform Image:"
# one_px_transform.output_original_and_blurred_image

# puts "Original 2px Transform Image:"
# two_px_transform.output_original_and_blurred_image

# puts "Original Edge Pixels Image:"
# px_edge_transform.output_original_and_blurred_image

puts "Original 2px Transform Image:"
two_px_transform.output_original_and_blurred_image(3)
puts "Result of Original"
two_px_transform.output_original_image