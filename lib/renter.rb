class Renter
attr_reader :name,
            :credit_card_number

  def initialize(name, cc_n)
    @name = name
    @credit_card_number = cc_n
  end

end
