def find_missing_number(sequence)
  arr = sequence.split
  arr.sort!
  
  if arr.length === 0
    p 0
  else
    arr2 = (1..arr.length).to_a
    arr.map! do |arr_item|
        arr_item.to_i
    end
    if arr[-1] == 0
      p 1
    else
      arr3 = arr2 - arr
      if arr3[0] == nil
        p 0
      else
        p arr3.pop
      end
    end
  end  
end



# find_missing_number("1 2 3 5") # 4,"It must work for missing middle terms"
# find_missing_number("1 3") # 2,"It must work for missing middle terms"
# find_missing_number("") # 0,"It must return 0 for an empty sequence"
# find_missing_number("2 3 4 5") # 1,"It must return 1 for a sequence missing the first element"
# find_missing_number("2 1 4 3 a") # 1,"It must return 1 for an invalid sequence"
find_missing_number("1 2 3 4 5") # 1,"It must return 0 for good sequence"


# Solution on Codewars to discuss with mentor
def find_missing_number(sequence)
  number_sequence = sequence.split.map(&:to_i).sort
  
  number_sequence.each.with_index(1) do |actual, expected|
    return expected unless actual == expected
  end
  
  0
end