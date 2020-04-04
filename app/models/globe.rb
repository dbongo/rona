class Globe < ApplicationRecord
  # before_save do |gc|
  #   key = ""

  #   unless gc.county_name.nil?
  #     key << gc.county_name
  #     key << ', '
  #   end

  #   unless gc.province_state.nil?
  #     key << gc.province_state
  #     key << ', '
  #   end

  #   key << gc.country_region

  #   gc.combined_key = key
  # end
end
