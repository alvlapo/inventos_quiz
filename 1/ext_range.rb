class ExtRange < Range
  def empty?
    return size == 0 ? true : false
  end

  def series_sum
    return ((min + max) * size) / 2
  end

  def cover?(value)
    if value.kind_of? Range
      return (include?(value.min) and include?(value.max))
    else
      super(value)
    end
  end
end
