class Dev < ActiveRecord::Base
    # Dev#freebies
    # returns a collection of all the freebies that the Dev has collected
    # NOTE: Taken care of by 'has_many' association macro

    # Dev#companies
    # returns a collection of all the companies that the Dev has 
    # collected freebies from
    # NOTE: Taken care of by 'has_many' association macro    
    has_many :freebies
    has_many :companies, through: :freebies

    # Dev#received_one?(item_name)
    # accepts an item_name (string) and returns true if any of 
    # the freebies associated with the dev has that item_name, 
    # otherwise returns false
    def received_one?(item_name)
        # First Attempt:
        # if freebie.where("Dev.item_name = item_name")
            # true
        # else
            # false
        # Second Attempt:
        # Ruby Docs page on '.any?':
        # https://ruby-doc.org/core-3.1.2/Enumerable.html
        self.freebies.any? do |freebie| 
            freebie.item_name == item_name
        end
    end

    # Dev#give_away(dev, freebie)
    # accepts a Dev instance and a Freebie instance, 
    # changes the freebie's dev to be the given dev; 
    # your code should only make the change if the freebie belongs 
    # to the dev who's giving it away

    # First attempt:
    # def give_away(@dev = dev, @freebie = freebie)        
        # if freebie.dev.name == dev.name
            # freebie.dev = dev
        # else 
            # null
    # end

    # Second attempt:
    def give_away(dev, freebie)
        # Ruby Docs pages on '#update' method:
        # https://www.rubydoc.info/docs/rails/4.1.7/ActiveRecord%2FRelation:update
        # Ruby Docs page more specifically on the 'ActiveRecord::Base'
        # based #update method, which is derived from the 'Persistence' method
        # https://www.rubydoc.info/docs/rails/4.1.7/ActiveRecord/Persistence#update-instance_method
        freebie.update(dev: dev) unless freebie.dev != self
    end    
end
