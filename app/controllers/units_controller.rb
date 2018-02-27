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
      "‘" => [Math::PI/10800, 'rad'],
      "second" => [Math::PI/648000, 'rad'],
      "\"" => [Math::PI/648000, 'rad'],
      "hectare" => [10000, 'm^2'],
      "ha" => [10000, 'm^2'],
      "litre" => [0.001, 'm^3'],
      "L" => [0.001, 'm^3'],
      "tonne" => [10^3, 'kg'],
      "t" => [10^3, 'kg']
    }
    answer = {
      "unit_name" => "",
      "multiplication_factor" => 1
    }
    denominators = []
    numerators = params[:units].split("/").first.scan(/\w+/) +
    params[:units].split("/").first.scan(/[\']/) +
    params[:units].split("/").first.scan(/[\°]/) +
    params[:units].split("/").first.scan(/[\"]/)

    if params[:units].include?("/")
      denominators = params[:units].split("/").last.scan(/\w+/) +
      params[:units].split("/").last.scan(/[\']/) +
      params[:units].split("/").last.scan(/[\°]/) +
      params[:units].split("/").last.scan(/[\"]/)
    end

    numerators.each do |numerator|
      answer["unit_name"] += (answer["unit_name"] == "") ? table[numerator].last : "*" + table[numerator].last
      answer["multiplication_factor"] *= table[numerator].first
    end

    denominators.each do |denominator|
      answer["unit_name"] += answer["unit_name"].include?("/") ? "*" + table[denominator].last : "/" + table[denominator].last
      answer["multiplication_factor"] /= table[denominator].first
    end

    answer["multiplication_factor"] = answer["multiplication_factor"].round(14)

    @test = answer
  end
end
