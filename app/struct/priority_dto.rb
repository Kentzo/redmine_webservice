class PriorityDto < ActionWebService::Struct
  member :id, :int
  member :name, :string
  member :is_default, :bool
  member :position, :int

  def self.create enum
    PriorityDto.new(
      :id => enum.id,
      :name => enum.name,
      :is_default => enum.is_default,
      :position => enum.position
    )
    rescue
      nil
  end
  
  def <=>(field)
    id <=> field.id
  end
  
  def hash
    id.hash
  end
  
  def eql?(r)
    self == r
  end
  
  def ==(r)
    id == r.id
  end
end