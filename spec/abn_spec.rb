require 'pry'
RSpec.describe Abn::CLI do
    it "fails if the number is less then 11 digits long" do
      num = Random.rand(10**Random.rand(10)).to_s
      expect(Abn::CLI.new.verify(num)).to be false
    end

    it "fails if the number is more then 11 digits long" do
      num = Random.rand(10**12).to_s
      expect(Abn::CLI.new.verify(num)).to be false
    end

    it "passes for 51824753556" do
      num = Random.rand(10**12).to_s
      expect(Abn::CLI.new.verify("51824753556")).to be true
    end
  end
