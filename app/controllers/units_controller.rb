class UnitsController < ApplicationController
  def si
    table = {
      "minute" => [60, 's'],
      "min" => [60, 's'],
      "hour" => [3600, 's'],
      "h" => [3600, 's'],
      "day" => [86400, 's'],
      "d" => [86400, 's'],
      "degree" => [Math::PI/180, 'rad'],
      " " => [Math::PI/180, 'rad'],
      "‘" => [Math::PI/10800], 'rad'],
      "second" => [Math::PI/648000, 'rad'],
      "hectare" => [10000, 'm^2'],
      "ha" => [10000, 'm^2'],
      "litre" => [0.001, 'm^3'],
      "L" => [0.001, 'm^3'],
      "tonne" => [10^3, 'kg'],
      "t" => [10^3, 'kg']
    }
    # @test = params[:units]
    # @test = table[" "]
  end
end
