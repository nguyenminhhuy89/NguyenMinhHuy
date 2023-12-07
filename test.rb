# a = [1,2,7,3,4,5]
# target = 8
# result = []
# a.each_with_index do |item, index|
#   minus = target - item
#   next if minus < 0
#   if a.include?(minus)
#     result = [index, a.index(minus)]
#   end
# end

# puts result

# (1..40).each do |num|
#   if num % 15 == 0
#     puts "num :#{num} => Fizz and Buzz"
#   elsif num % 3 == 0
#     puts "num :#{num} => Fizz"
#   elsif num % 5 == 0
#     puts "num :#{num} => Buzz"
#   end
# end


a = "abcdlkjhyua"
duplicate = ""
arr = []
a.each_char do |item|
  if arr.include?(item)
    duplicate = item
    break
  else
    arr << item
  end
end

puts duplicate