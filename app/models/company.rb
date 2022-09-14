class Company < ActiveRecord::Base
    # Company#freebies
    # returns a collection of all the freebies for the Company
    # NOTE: This was taken care of by the 'has_many' association
    # macro

    # Company#devs
    # returns a collection of all the devs who collected freebies 
    # from the Company
    # NOTE: This was taken care of by the 'has_many' association 
    # macro
    has_many :freebies
    has_many :devs, through: :freebies

    # Company#give_freebie(dev, item_name, value)
    # takes a dev (an instance of the Dev class), 
    # an item_name (string), and a value as arguments, 
    # and creates a new Freebie instance associated with 
    # this company and the given dev
    def give_freebie(dev, item_name, value)
        # First attempt:
        # freebie = Freebie(@dev = dev, @item_name = item_name, @value = value)
        # Second attempt:
        # Freebie.create(:item_name = item_name, :value = value, :dev = dev)
        # Third attempt:
        # Freebie.create(item_name: item_name, value: value, dev: dev)
        # Fourth attempt:
        # Related Ruby Active Record Docs page on ':create' method:
        # https://apidock.com/rails/ActiveRecord/Base/create/class
        Freebie.create(item_name: item_name, value: value, dev: dev, company: self)
    end

    # Company.oldest_company
    # returns the Company instance with the earliest founding year
    def self.oldest_company()
        # First attempt:
        # Company.founding_year.last()

        # Second attempt
        # Ruby Docs page on '.all' under '5.2 Read':
        # https://guides.rubyonrails.org/active_record_basics.html
        # Ruby Docs page on '.order' under 
        # 'first will return the first record ordered by 
        # the specified attribute for order.' section:
        # https://guides.rubyonrails.org/active_record_querying.html
        # Other Ruby Docs page on '.order()':
        # https://apidock.com/rails/ActiveRecord/QueryMethods/order
        Company.all.order(:founding_year).first()
    end
end
