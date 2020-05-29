require "./spec_helper"

describe Type do
  describe "#effectiveness_against" do
    it "supports not very effective" do
      Type::Fire.effectiveness_against({Type::Water}).should eq 0.5
    end

    it "supports super effective" do
      Type::Water.effectiveness_against({Type::Fire}).should eq 2
    end

    it "supports 0 effectiveness" do
      Type::Fighting.effectiveness_against({Type::Ghost}).should eq 0
    end

    it "defaults to unchanged effectiveness" do
      Type::Fire.effectiveness_against({Type::Fighting}).should eq 1
    end

    it "is quartered by using a double weak move" do
      Type::Fire.effectiveness_against({Type::Water, Type::Dragon}).should eq 0.25
    end

    it "is quadrupled by using a double strong move" do
      Type::Fire.effectiveness_against({Type::Bug, Type::Grass}).should eq 4
    end

    it "can combine a strong type and a weak type to regular effectiveness" do
      Type::Fire.effectiveness_against({Type::Water, Type::Grass}).should eq 1
    end

    it "does not combine 0 effectiveness" do
      Type::Fighting.effectiveness_against({Type::Dark, Type::Ghost}).should eq 0
    end
  end
end
