require "spec_helper"

describe String do
  describe "#**" do
    subject do
      "Reports" ** {
        marketing: "Marketing Reports"
      }
    end

    it "returns a Hashtring" do
      expect(subject).to be_a(Hashtring::Constructor)
    end
  end
end
