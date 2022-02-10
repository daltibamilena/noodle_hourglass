time_to_cook = ARGV[0].to_i
hourglass_one = ARGV[1].to_i
hourglass_two = ARGV[2].to_i

def mdc(hourglass_one, hourglass_two)
  resto = nil

  while resto != 0 do
    resto = hourglass_one % hourglass_two
    hourglass_one = hourglass_two
    hourglass_two = resto
  end

  return hourglass_one
end

def minutes_to_cook?(time_to_cook, hourglass_one, hourglass_two)
  total_time = 0
  previous_hourglass_one = hourglass_one
  previous_hourglass_two = hourglass_two
  time_difference = nil

  while time_difference != 0
    if time_difference == time_to_cook
      total_time += time_to_cook
      break
    end

    if previous_hourglass_one > previous_hourglass_two
      time_difference = previous_hourglass_one - previous_hourglass_two
      total_time += previous_hourglass_two
      previous_hourglass_one = time_difference
      previous_hourglass_two = hourglass_two
    else
      time_difference = previous_hourglass_two - previous_hourglass_one
      total_time += previous_hourglass_one
      previous_hourglass_two = time_difference
      previous_hourglass_one = hourglass_one
    end
  end

  return "O tempo total para preparar o miojo é de: #{total_time} minutos "
end

can_cook = time_to_cook % mdc(hourglass_one, hourglass_two)
result = can_cook == 0 ? minutes_to_cook?(time_to_cook, hourglass_one, hourglass_two) : "Não é possível!"
puts result