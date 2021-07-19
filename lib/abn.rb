require "abn/version"

module Abn
  def self.verify(abn)
    return false if abn.to_s.length != 11
    true
  end
end
