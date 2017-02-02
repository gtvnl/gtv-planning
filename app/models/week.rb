class Week
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name, :type => String
  field :number, :type => Integer
  field :mechanics, :type => Integer, default: 3
  field :default_hours, :type => Float, default: 39.5

  def capacity
    mechanics * default_hours
  end

end
