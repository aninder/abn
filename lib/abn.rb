require "abn/version"
require 'thor'
module Abn
  class CLI < Thor

    desc "verify [abn]", "check if the given ABN is valid"
    def verify(abn)
      abn = abn.to_i.to_s
      #The Australian Business Number (ABN) is a unique 11 digit identifier
      if(abn.length != 11)
        puts  "ABN is invalid"
        return false
      end

      #Subtract 1 from the first (left-most) digit
      temp = (abn[0].to_i-1).to_s+abn[1..11]

      #Multiply each of the digits in this new number by a "weighting factor" based on its position
      # Sum the resulting 11 products
      weights = {0=>10, 1=>1, 2=>3, 3=>5, 4=>7, 5=>9, 6=>11, 7=>13, 8=>15, 9=>17, 10=>19}
      tot=0
      temp.length.times{|r,i|  tot+=temp.slice(r).to_i*weights[r]}

      # Divide the sum total by 89, noting the remainder
      remainder = tot%89
      if(remainder == 0)
        puts "ABN is VALID"
        return true
      else
        puts  "ABN is invalid"
        return false
      end
    end
  end
end
