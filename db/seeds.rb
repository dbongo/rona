# frozen_string_literal: true

require 'csv'

country_rows = CSV.read('storage/COVID-19/data/cases_country.csv')
country_headings = country_rows.shift

country_rows.each do |row|
  country = Country.new

  country.name        = row.shift.strip
  country.last_update = DateTime.parse(row.shift)
  country.lat         = row.shift.to_f
  country.long        = row.shift.to_f
  country.confirmed   = row.shift.to_i
  country.deaths      = row.shift.to_i
  country.recovered   = row.shift.to_i
  country.active      = row.shift.to_i

  country.save
end

state_rows = CSV.read('storage/COVID-19/data/cases_state.csv')
state_headings = state_rows.shift

state_rows.each do |row|
  fips = row.shift
  name = row.shift

  country = Country.find_by(name: row.shift.strip)
  next if country.nil?

  state = country.states.new

  state.fips = fips
  state.name = name

  last_update = row.shift

  unless last_update.nil?
    state.last_update = DateTime.parse(last_update) rescue DateTime.now
  end

  state.lat       = row.shift.to_f
  state.long      = row.shift.to_f
  state.confirmed = row.shift.to_i
  state.deaths    = row.shift.to_i
  state.recovered = row.shift.to_i
  state.active    = row.shift.to_i

  state.save
end

cases = CSV.read('storage/COVID-19/data/cases.csv')
headings = cases.shift

cases.each do |row|
  fips = row.shift
  name = row.shift

  state = State.find_by name: row.shift
  next if state.nil?

  county = state.counties.new

  country = state.country

  county.country_id = country.id

  country_str = row.shift
  last_update = row.shift

  county.fips = fips
  county.name = name

  unless last_update.nil?
    begin
      county.last_update = DateTime.parse last_update
    rescue
      county.last_update = DateTime.now
    end
  end

  county.lat       = row.shift.to_f
  county.long      = row.shift.to_f
  county.confirmed = row.shift.to_i
  county.deaths    = row.shift.to_i
  county.recovered = row.shift.to_i
  county.active    = row.shift.to_i
  county.fullname  = row.shift

  county.save
end
