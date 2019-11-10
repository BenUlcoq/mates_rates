class AvailabilityValidator < ActiveModel::EachValidator
  
  # Custom validator for checking that dates do not overlap with existing rentals when creating a rental.

  def validate_each(record, attribute, value)
    # Grabs all of the relevant rentals.
    rentals = Rental.where(["tool_id=?", record.tool_id])

    # Formats the dates into ranges for comparison.
    date_ranges = rentals.map { |rental| rental.start_date..rental.end_date }

    # Iterate over each range.
    date_ranges.each do |range|
      # Compare with the dates being passed in and return error if unavailable.
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end
