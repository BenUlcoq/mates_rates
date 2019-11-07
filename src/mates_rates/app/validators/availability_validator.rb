class AvailabilityValidator < ActiveModel::EachValidator
  # hellohhh
  def validate_each(record, attribute, value)
    rentals = Rental.where(["tool_id=?", record.tool_id])
    date_ranges = rentals.map { |rental| rental.start_date..rental.end_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end
