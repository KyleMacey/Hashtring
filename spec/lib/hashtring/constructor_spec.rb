require "spec_helper"

describe Hashtring::Constructor do
  subject do
    Hashtring::Constructor.new(
      "Reports", {
        marketing: "Marketing Reports"
      }
    )
  end

  describe "#[]" do
    it 'returns a value from the hash' do
      expect(subject[:marketing]).to eq("Marketing Reports")
    end

    context "when the key does not exist" do
      it "returns nil" do
        expect(subject[:wrong]).to be_nil
      end
    end
  end

  describe "#inspect" do
    it "returns the name" do
      expect(subject.inspect).to eq("Reports")
    end
  end

  describe "#method_missing" do
    context "when the hash key exists" do
      it "returns a value from the hash" do
        expect(subject.marketing).to eq("Marketing Reports")
      end
    end

    context "when the hash key does not exist" do
      it "raises a no method error" do
        expect{ subject.wrong }.to raise_error(NoMethodError)
      end
    end
  end

  describe "#to_s" do
    it "returns the name" do
      expect(subject.to_s).to eq("Reports")
    end
  end
end
