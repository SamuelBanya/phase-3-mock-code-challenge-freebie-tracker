class Freebie < ActiveRecord::Base
    # Freebie#dev
    # returns the Dev instance for this Freebie
    # NOTE: Taken care of by the 'belongs_to' association macro

    # Freebie#company
    # returns the Company instance for this Freebie
    # NOTE: Taken care of by the 'belongs_to' association macro    
    belongs_to :dev
    belongs_to :company

    # Freebie#print_details
    # should return a string formatted as follows: 
    # {insert dev's name} owns a {insert freebie's item_name} 
    # from {insert company's name}
    def print_details()
        # First attempt:
        # "#{dev.name} owns a #{freebie.item_name} from #{company.name}"
        # Second attempt:
        "#{dev.name} owns a #{item_name} from #{company.name}" 
    end
end
