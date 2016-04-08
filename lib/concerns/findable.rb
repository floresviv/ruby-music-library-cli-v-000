module Concerns::Findable

	def self.find_by_name(name)
  		self.all.detect{|a| a.name}
  	end

  	def self.find_or_create_by_name(name)
	    if self.all.include?(name)
	       self.find_by_name(name)
	    else
	       self.new(name)
	    end
 	end

end