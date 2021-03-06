class Applicant
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def self.new_id
    SecureRandom.uuid
  end

  def ==(other)
    other.id == id
  end
end