RSpec.describe Abn do
  it "has a version number" do
    expect(Abn::VERSION).not_to be nil
  end

  describe "#verify" do
    it "fails if the number is less then 11 digits long" do
      num = Random.rand(10**Random.rand(10))
      expect(Abn.verify(num)).to be false
    end

    it "fails if the number is more then 11 digits long" do
      num = Random.rand(10**12)
      expect(Abn.verify(51824753556)).to be false
    end

    it "is ok if the number is 11 digits long" do
      num = 11.times.map{ rand(1..9) }.join.to_i
      expect(Abn.verify(num)).to be true
    end
  end
end
