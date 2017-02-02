class Week
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name, :type => String
  field :number, :type => Integer
  field :mechanics, :type => Integer, default: 3
  field :days, :type => Integer, default: 5

  def capacity
    mechanics * 7.5 * days
  end

end
