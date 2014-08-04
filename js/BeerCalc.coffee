---
---

do (window, document) ->
  class window.BeerCalc
    # BeerCalc constructor
    constructor: (@targetSalaryInput, @targetCountryInput, @targetOutput) ->
      @data = window.beerData
      @targetSalaryInput.addEventListener 'keyup', (e) =>
        console.log 'keyup'
        # Normalize:
        salary = @targetSalaryInput.value.replace(',', '.')
        salary = if salary isnt '' then salary else 0
        salary = parseFloat(salary)

        # Get country and check if it's valid:
        countryCode = @targetCountryInput.value
        if countryCode not of @data
          throw 'Selected country code does not hold any data'

        # Retrieve the country name
        countryName = @data[countryCode].country

        salaryInBeer = @calculate(salary, countryCode)
        @targetOutput.innerHTML = "You would earn <strong>#{salaryInBeer}</strong> pints of beer per month if you would live in <strong>#{countryName}</strong>."

    # Calculates the amount of beer-salary in the given country
    calculate: (salary, countryCode) ->
      beerPrice = @data[countryCode].price
      beerSalary = Math.floor salary / beerPrice

      return beerSalary
