require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  i = 0
  until array[i] == nil
    i += 1
  end
  return i
end

# Prints each integer values in the array
def print_array(array)
  i = 0
  until array[i] == nil
    print "#{array[i]} "
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  return false if length <= 0
  i = 0
  until i == length
    return true if array[i] == value_to_find
    i += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  return nil if length <= 0
  largest = array[0]
  i = 1
  until i == length
    largest = array[i] if array[i] > largest
    i += 1
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  return nil if length <= 0
  smallest = array[0]
  i = 1
  until i == length
    smallest = array[i] if array[i] < smallest
    i += 1
  end
  return smallest
end

# Reverses the values in the integer array in place
def reverse(array, length)
  if length > 1
    i = 0
    j = length - 1
    while i < j
      temp = array[i]
      array[i] = array[j]
      array[j]= temp
      i += 1
      j -= 1
    end
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  return false if length <= 0
  low = 0
  high = length - 1
  while low < high
    mid = (low + high) / 2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    else # array[mid] < value_to_find
      low = mid + 1
    end
  end
  return array[low] == value_to_find
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
