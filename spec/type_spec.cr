require "./spec_helper"

describe Type do
  describe "#effectiveness_against" do
    it "supports not very effective" do
      Type::Fire.effectiveness_against(Type::Water)
        .should eq TypeChart::Effectiveness::NotVery
    end

    it "supports super effective" do
      Type::Water.effectiveness_against(Type::Fire)
        .should eq TypeChart::Effectiveness::Super
    end

    it "defaults to unchanged effectiveness" do
      Type::Fire.effectiveness_against(Type::Fire)
        .should eq TypeChart::Effectiveness::Unchanged
    end
  end
end
