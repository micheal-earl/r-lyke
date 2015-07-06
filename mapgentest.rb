# Trying to write a map generation algorithm, this file will be integrated into main when it's completed

def generate_organic_map(width, height)

  map_array = []

  for y in 0...height
    map_array[y] = [1] * width
    for x in 0...width
      map_array[y][x] = [rand(2)]
    end
  end

  return map_array

end

def do_simulation_step(old_array)
  map_array = old_array

end

def count_alive_neighbors(map_array, x, y)

    count = 0
    for i in -1...2
      for j in -1...2
        neighbour_x = x + i
        neighbour_y = y + j
        if (i == 0 && j == 0)
          # Do nothing
        elsif (neighbour_x < 0 || neighbour_y < 0 || neighbour_x >= map.length || neighbour_y >= map[0].length)
          count += 1
        elsif (map_array[neighour_x][neighbour_y])
          count += 1
        end
      end
    end

    return count

end

p generate_organic_map(10, 10)
